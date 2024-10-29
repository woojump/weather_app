import 'package:weather_app/models/types.dart';

enum WeatherCondition {
  cloudLightning('svg/climacon-cloud_lightning.svg'),
  cloudRain('svg/climacon-cloud_rain.svg'),
  cloudSnow('svg/climacon-cloud_snow_alt.svg'),
  sun('svg/climacon-sun.svg'),
  cloudSun('svg/climacon-cloud_sun.svg');

  final String imagePath;
  const WeatherCondition(this.imagePath);

  static WeatherCondition fromInt(int i) {
    return switch (i) {
      < 300 => WeatherCondition.cloudLightning,
      < 600 => WeatherCondition.cloudRain,
      < 700 => WeatherCondition.cloudSnow,
      800 => WeatherCondition.sun,
      _ => WeatherCondition.cloudSun,
    };
  }
}

class WeatherInfo {
  final String name;
  final double temperature;
  final WeatherCondition condition;
  final String description;

  const WeatherInfo({
    required this.name,
    required this.temperature,
    required this.condition,
    required this.description,
  });

  factory WeatherInfo.fromJson(Json json) {
    return WeatherInfo(
      name: json['name'],
      temperature: json['main']['temp'] as double,
      condition: WeatherCondition.fromInt(json['weather'][0]['id'] as int),
      description: json['weather'][0]['description'] as String,
    );
  }
}
