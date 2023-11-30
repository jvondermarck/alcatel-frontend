import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:pushtotalk/class/rainbow_user.dart';

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

  Future<bool> logout() async {
    bool result = false;
    try {
      result = await platform.invokeMethod("logout", {});
    } on PlatformException catch (e) {
      debugPrint("ERROR -> ${e.message}");
    }
    return result;
  }

  Future<RainbowUser> getRainbowUser() async {
    Map<Object?, Object?> result = {};
    try {
      result = await platform.invokeMethod("getRainbowUser", {});
    } on PlatformException catch (e) {
      debugPrint("ERROR -> ${e.message}");
    }
    return RainbowUser.fromMap(result);
  }
}
