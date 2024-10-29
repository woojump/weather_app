import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

abstract class LocationRepository {
  Future<Position?> getMyCurrentLocation();
}

class LocationRepositoryImpl implements LocationRepository {
  @override
  Future<Position?> getMyCurrentLocation() async {
    try {
      await Geolocator.requestPermission();
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } catch (e) {
      debugPrint('error in getMyCurrentLocation()');
      return null;
    }
  }
}
