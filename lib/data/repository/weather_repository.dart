import 'package:flutter/material.dart';
import 'package:weather_app/data/network.dart';
import 'package:weather_app/models/types.dart';
import 'package:weather_app/models/weather_model.dart';

abstract class WeatherRepository {
  Future<WeatherInfo?> getWeatherInfo(double latitude, double longitude);
}

class WeatherRepositoryImpl implements WeatherRepository {
  final Network network;
  final String apiKey;

  const WeatherRepositoryImpl(this.network, this.apiKey);

  @override
  Future<WeatherInfo?> getWeatherInfo(
    double latitude,
    double longitude,
  ) async {
    final Json? resultJson = await network.getJsonData(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');
    if (resultJson == null) {
      debugPrint('API 통신 오류입니다.');
      return null;
    }
    try {
      return WeatherInfo.fromJson(resultJson);
    } catch (e) {
      debugPrint('날씨 정보를 가져와 매핑 중 발생한 오류입니다: $e');
      return null;
    }
  }
}
