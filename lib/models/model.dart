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
}
