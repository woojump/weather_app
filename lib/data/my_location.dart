import 'package:geolocator/geolocator.dart';

class MyLocation {
  late final double myLatitude;
  late final double myLongitude;

  Future<void> getMyCurrentLocation() async {
    try {
      // ignore: unused_local_variable
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      myLatitude = position.latitude;
      myLongitude = position.longitude;
    } catch (e) {
      print('error in getMyCurrentLocation()');
    }
  }
}
