import 'package:weather_app/models/types.dart';

enum AirCondition {
  cloudLightning('svg/climacon-cloud_lightning.svg'),
  cloudRain('svg/climacon-cloud_rain.svg'),
  cloudSnow('svg/climacon-cloud_snow_alt.svg'),
  sun('svg/climacon-sun.svg'),
  cloudSun('svg/climacon-cloud_sun.svg');

  final String imagePath;
  const AirCondition(this.imagePath);

  static AirCondition fromInt(int i) {
    return switch (i) {
      < 300 => AirCondition.cloudLightning,
      < 600 => AirCondition.cloudRain,
      < 700 => AirCondition.cloudSnow,
      800 => AirCondition.sun,
      _ => AirCondition.cloudSun,
    };
  }
}

class AirInfo {
  final AirCondition condition;
  final double fineDust;
  final double ultraFineDust;

  const AirInfo({
    required this.condition,
    required this.fineDust,
    required this.ultraFineDust,
  });

  factory AirInfo.fromJson(Json json) {
    return AirInfo(
      condition: AirCondition.fromInt(json['list'][0]['main']['aqi']),
      fineDust: json['list'][0]['components']['pm2_5'],
      ultraFineDust: json['list'][0]['components']['pm10'],
    );
  }
}
