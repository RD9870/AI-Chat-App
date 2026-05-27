import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ai_chat_app/providers/base_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ai_chat_app/services/connectivity_services.dart';

// authantication cases
enum AuthStatus {
  uninitialized,
  unauthenticated,
  authenticated,
  authenticating,
}

class AuthProvider extends BaseProvider {
  // initial authorization status
  AuthStatus status = AuthStatus.uninitialized;
  // user access token
  String? token;
  // --------------pre filled login info-----------------------
  // TODO: change to valid data
  TextEditingController nameController = TextEditingController(
    text: "test User",
  );
  TextEditingController phoneController = TextEditingController(
    text: "0912345678",
  );
  TextEditingController passwordController = TextEditingController(
    text: "password123",
  );
  TextEditingController confirmPasswordController = TextEditingController(
    text: "password123",
  );
  // show password variable
  bool hidePassword = true;
  // show confirm password variable
  bool hideConfirmPassword = true;
  // working internet connection variable
  bool? hasInternet;

  // check if the user's authorization status
  Future<void> initAuthProvider() async {
    // SharedPreferences to store and accssess localy stored data
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // internet connectioon status
    hasInternet = await ConnectivityServices.hasInternet();
    debugPrint("hasInternet: $hasInternet");
    // get stored token if it exsists
    String? tempToken = prefs.getString("token");

    // change status and update token variable if user has already logged in
    if (tempToken != null) {
      status = AuthStatus.authenticated;
      token = tempToken;
      // print useful data in debug mode
      if (kDebugMode) {
        print("TOKEN : $tempToken");
      }
    }
    // user hasen't logged in change the values of the auth state and token accordingly
    else {
      status = AuthStatus.unauthenticated;
      token = null;
    }
    notifyListeners();
  }

  // sign up a new user
  Future<List> register(Map body) async {
    setBusy(true);
    final response = await api.post("/register", body);
    if (response.statusCode == 201) {
      setFailed(false);
      setBusy(false);
      return [true, "User Registered Successfully"];
    } else {
      setFailed(true);
      setBusy(false);
      return [false, json.decode(response.body)['message']];
    }
  }

  // log user into the app
  Future<List> login(Map body) async {
    setBusy(true);
    final response = await api.post("/login", body);
    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // storw the token locally and update the auth status
      prefs.setString("token", json.decode(response.body)['access_token']);
      token = json.decode(response.body)['access_token'];
      status = AuthStatus.authenticated;
      setFailed(false);
      setBusy(false);
      return [true, "User Loged Successfully"];
    } else {
      setFailed(true);
      setBusy(false);
      return [false, json.decode(response.body)['message']];
    }
  }

  // log user out
  Future<List> logout() async {
    setBusy(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // send log out call to the backend
    final response = await api.post("/logout", {});
    // response goes through
    if (response.statusCode == 200) {
      // delete token from local storage and update auth status
      prefs.remove("token");
      status = AuthStatus.unauthenticated;
      setFailed(false);
      setBusy(false);
      return [true, json.decode(response.body)["Message"]];
    }
    // something goes wrong with the call
    else {
      setFailed(true);
      setBusy(false);
      return [false, json.decode(response.body)["Message"]];
    }
  }

  // -----------------------validation and control method for the text fields-------------------------------

  String? validateName(String? val) {
    if (val!.isEmpty) {
      return "Name is Required";
    }
    return null;
  }

  String? validatePhone(String? val) {
    if (val!.isEmpty) {
      return "Phone is Required";
    }
    if (val.length != 10) {
      return "Phone must be 10 digts at least";
    }
    return null;
  }

  String? validatePassword(String? val) {
    if (val!.isEmpty) {
      return "Password is Required";
    }
    if (val.length < 8) {
      return "Password must be at least 10 digts long";
    }
    return null;
  }

  String? validateConfirmPassword(String? val) {
    if (val!.isEmpty) {
      return "Password confirmation is Required";
    }
    if (val.length < 8) {
      return "Password must be at least 10 digts long";
    }
    if (val != passwordController.text) {
      return "Password confirmation must match passwrd";
    }
    return null;
  }

  void setHidePassword() {
    debugPrint("hidePassword =$hidePassword");
    debugPrint("!hidePassword =${!hidePassword}");
    hidePassword = !hidePassword;
    notifyListeners();
  }

  void setHideConfirmPassword() {
    hideConfirmPassword = !hideConfirmPassword;
    notifyListeners();
  }
}
