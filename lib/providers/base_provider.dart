import 'package:flutter/cupertino.dart';
import 'package:v_wallet_frontend/services/api.dart';

class BaseProvider with ChangeNotifier {
  // loading indicator variable, api instance, failing variable and error mesage variable
  bool busy = false;
  Api api = Api();
  bool failed = false;
  String? errorMessage;

  // change loading value
  void setBusy(bool status) {
    busy = status;
    notifyListeners();
  }

  // change failed variable value
  void setFailed(bool status) {
    failed = status;
    notifyListeners();
  }

  // change error message value
  void setErrorMessage(String? msg) {
    errorMessage = msg;
    notifyListeners();
  }
}
