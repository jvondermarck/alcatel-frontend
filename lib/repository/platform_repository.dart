import 'package:flutter/services.dart';

class PlatformRepository {
  static const platform = const MethodChannel('flutter.native/helper');

  Future<bool> isRainbowSdkInitialized() async {
    bool result = false;
    try {
      result = await platform.invokeMethod("isRainbowSdkInitialized", {});
    } on PlatformException catch (e) {
      print("ERROR -> ${e.message}");
    }
    return result;
  }
}
