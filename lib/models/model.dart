import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Model {
  Widget getWeatherIcon(int condition) {
    if (condition < 300) {
      return SvgPicture.asset('svg/climacon-cloud_lightning.svg');
    } else if (condition < 600) {
      return SvgPicture.asset('svg/climacon-cloud_rain.svg');
    } else if (condition < 700) {
      return SvgPicture.asset('svg/climacon-cloud_snow_alt.svg');
    } else if (condition == 800) {
      return SvgPicture.asset('svg/climacon-sun.svg');
    } else {
      return SvgPicture.asset('svg/climacon-cloud_sun.svg');
    }
  }

  Widget getAirIcon(int condition) {
    if (condition == 1) {
      return Image.asset(
        'image/good.png',
        width: 37.0,
        height: 35.0,
      );
    } else if (condition == 2) {
      return Image.asset(
        'image/fair.png',
        width: 37.0,
        height: 35.0,
      );
    } else if (condition == 3) {
      return Image.asset(
        'image/moderate.png',
        width: 37.0,
        height: 35.0,
      );
    } else if (condition == 4) {
      return Image.asset(
        'image/poor.png',
        width: 37.0,
        height: 35.0,
      );
    } else {
      return Image.asset(
        'image/bad.png',
        width: 37.0,
        height: 35.0,
      );
    }
  }

  String getAirState(int condition) {
    if (condition == 1) {
      return '매우 좋음';
    } else if (condition == 2) {
      return '좋음';
    } else if (condition == 3) {
      return '보통';
    } else if (condition == 4) {
      return '나쁨';
    } else {
      return '매우 나쁨';
    }
  }
}
