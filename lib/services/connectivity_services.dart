import 'dart:io';
import 'package:flutter/rendering.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class ConnectivityServices {
  // check if there's an internet connection
  static Future<bool> hasInternet() async {
    try {
      final bool isConnected = await InternetConnection().hasInternetAccess;
      return isConnected;
    } on SocketException catch (error) {
      debugPrint("internet connection checker plus error: ${error.message}");
      return false;
    }
  }
}
