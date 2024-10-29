import 'package:flutter/material.dart';
import 'package:weather_app/data/network.dart';
import 'package:weather_app/models/air_model.dart';
import 'package:weather_app/models/types.dart';

abstract class AirRepository {
  Future<AirInfo?> getAirInfo(double latitude, double longitude);
}

class AirRepositoryImpl implements AirRepository {
  final Network network;
  final String apiKey;

  const AirRepositoryImpl(this.network, this.apiKey);

  @override
  Future<AirInfo?> getAirInfo(
    double latitude,
    double longitude,
  ) async {
    final Json? resultJson = await network.getJsonData(
        'http://api.openweathermap.org/data/2.5/air_pollution?lat=$latitude&lon=$longitude&appid=$apiKey');
    if (resultJson == null) {
      debugPrint('API 통신 오류입니다.');
      return null;
    }
    try {
      return AirInfo.fromJson(resultJson);
    } catch (e) {
      debugPrint('공기질 정보를 매핑하는 중 발생한 오류입니다.');
    }
    return null;
  }
}
