import 'package:weather_app/models/types.dart';

enum AirCondition {
  good('매우 좋음', 'images/moderate.png'),
  fair('좋음', 'images/moderate.png'),
  moderate('보통', 'images/moderate.png'),
  poor('나쁨', 'images/moderate.png'),
  bad('매우 나쁨', 'images/moderate.png');

  final String text;
  final String imagePath;
  const AirCondition(this.text, this.imagePath);

  static AirCondition fromInt(int i) {
    return switch (i) {
      1 => AirCondition.good,
      2 => AirCondition.fair,
      3 => AirCondition.moderate,
      4 => AirCondition.poor,
      5 => AirCondition.bad,
      _ => throw Exception('존재하지 않는 날씨 상태입니다.'),
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
      condition: AirCondition.fromInt(json['list'][0]['main']['aqi'] as int),
      fineDust: json['list'][0]['components']['pm2_5'] as double,
      ultraFineDust: json['list'][0]['components']['pm10'] as double,
    );
  }
}
