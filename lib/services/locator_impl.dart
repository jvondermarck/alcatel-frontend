import 'package:geolocator/geolocator.dart';
import 'package:pushtotalk/interfaces/locator.dart';

class LocatorImp implements Locator {
  @override
  Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}
