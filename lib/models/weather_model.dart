import 'package:weather_app/models/types.dart';

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
      temperature: json['main']['temp'],
      condition: WeatherCondition.fromInt(json['weather']['id']),
      description: json['weather'][0]['description'],
    );
  }
}

enum WeatherCondition {
  good('매우 좋음', 'image/moderate.png'),
  fair('좋음', 'image/moderate.png'),
  moderate('보통', 'image/moderate.png'),
  poor('나쁨', 'image/moderate.png'),
  bad('매우 나쁨', 'image/moderate.png');

  final String text;
  final String imagePath;
  const WeatherCondition(this.text, this.imagePath);

  static WeatherCondition fromInt(int i) {
    return switch (i) {
      1 => WeatherCondition.good,
      2 => WeatherCondition.fair,
      3 => WeatherCondition.moderate,
      4 => WeatherCondition.poor,
      5 => WeatherCondition.bad,
      _ => throw Exception('존재하지 않는 날씨 상태입니다.'),
    };
  }
}
