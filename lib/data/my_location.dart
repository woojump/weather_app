import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class MyLocation {
  late final double myLatitude;
  late final double myLongitude;

  Future<void> getMyCurrentLocation() async {
    try {
      await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      myLatitude = position.latitude;
      myLongitude = position.longitude;
    } catch (e) {
      debugPrint('error in getMyCurrentLocation()');
    }
  }
}
