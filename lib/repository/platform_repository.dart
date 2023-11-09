import 'package:flutter/services.dart';

class PlatformRepository {
  static const platform = MethodChannel('flutter.native/helper');

  Future<bool> isRainbowSdkInitialized() async {
    bool result = false;
    try {
      result = await platform.invokeMethod("isRainbowSdkInitialized", {});
    } on PlatformException catch (e) {
      print("ERROR -> ${e.message}");
    }
    return result;
  }
  // TODO - add login function to communicate with Kotlin

  Future<bool> login(String email, String password) async {
    bool result = false;
    try {
      result = await platform.invokeMethod("login", {
        "email": email,
        "password": password,
      });
    } on PlatformException catch (e) {
      print("ERROR -> ${e.message}");
    }
    return result;
  }
}
