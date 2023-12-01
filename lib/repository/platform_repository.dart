import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

// Used as a bridge between Flutter and Kotlin code

class PlatformRepository {
  static const platform = MethodChannel('flutter.native/helper');

  Future<bool> isRainbowSdkInitialized() async {
    bool result = false;
    try {
      result = await platform.invokeMethod("isRainbowSdkInitialized", {});
    } on PlatformException catch (e) {
      debugPrint("ERROR -> ${e.message}");
    }
    return result;
  }

  Future<bool> login(String email, String password) async {
    bool result = false;
    try {
      result = await platform.invokeMethod("login", {
        "email": email,
        "password": password,
      });
    } on PlatformException catch (e) {
      debugPrint("ERROR -> ${e.message}");
    }
    return result;
  }

  // TODO1 : Method to create / modify / delete bubbles
}
