import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:v_wallet_frontend/helpers/consts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  // get the locally stored token
  Future<String?> getToken() async {
    // create a SharedPreferences instance and return the stored token
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }

  // get token and return the api call header
  Future<Map<String, String>> getHeader() async {
    String? token = await getToken();
    // print useful data when debugging
    if (kDebugMode) {
      print("TOKEN IN GETHEADER : $token");
    }
    return {"Accept": "application/json", "Authorization": "Bearer $token"};
  }

  // send a get request to the backend
  Future<http.Response> get(String endPoint) async {
    final response = await http.get(
      Uri.parse("$baseUrl$endPoint"),
      headers: await getHeader(),
    );
    // print useful data when debugging
    if (kDebugMode) {
      print("RESPONSE GET : $baseUrl$endPoint");
      print("RESPONSE STATUS CODE : ${response.statusCode}");
      print("RESPONSE BODY : ${response.body}");
    }
    return response;
  }

  // send a post request to the backend
  Future<http.Response> post(String endPoint, Map body) async {
    final response = await http.post(
      Uri.parse("$baseUrl$endPoint"),
      headers: await getHeader(),
      body: body,
    );
    // print useful data when debugging
    if (kDebugMode) {
      print("RESPONSE POST : $baseUrl$endPoint");
      print("RESPONSE STATUS CODE : ${response.statusCode}");
      print("RESPONSE BODY : ${response.body}");
    }
    return response;
  }

  // send a put request to the backend
  Future<http.Response> put(String endPoint, Map body) async {
    final response = await http.put(
      Uri.parse("$baseUrl$endPoint"),
      body: body,
      headers: await getHeader(),
    );
    // print useful data when debugging
    if (kDebugMode) {
      print("RESPONSE PUT : $baseUrl$endPoint");
      print("RESPONSE STATUS CODE : ${response.statusCode}");
      print("RESPONSE BODY : ${response.body}");
    }
    return response;
  }

  // send a delete request to the backend
  Future<http.Response> delete(String endPoint, Map body) async {
    final response = await http.delete(
      Uri.parse("$baseUrl$endPoint"),
      body: body,
      headers: await getHeader(),
    );
    // print useful data when debugging
    if (kDebugMode) {
      print("RESPONSE DELETE : $baseUrl$endPoint");
      print("RESPONSE STATUS CODE : ${response.statusCode}");
      print("RESPONSE BODY : ${response.body}");
    }
    return response;
  }
}
