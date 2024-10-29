import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/air_model.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/screens/widgets/weather_info_box.dart';

class WeatherScreen extends StatefulWidget {
  final WeatherInfo weatherInfo;
  final AirInfo airInfo;

  const WeatherScreen({
    super.key,
    required this.weatherInfo,
    required this.airInfo,
  });

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String getSystemTime() {
    var now = DateTime.now();
    return DateFormat('h:mm a').format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'images/background.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 100.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      widget.weatherInfo.name,
                      style: GoogleFonts.lato(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TimerBuilder.periodic(
                          const Duration(minutes: 1),
                          builder: (context) => Text(
                            getSystemTime(),
                            style: GoogleFonts.lato(
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          DateFormat(' - EEEE, d MMM, yyy').format(
                            DateTime.now(),
                          ),
                          style: GoogleFonts.lato(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '${widget.weatherInfo.temperature}\u2103',
                      style: GoogleFonts.lato(
                        fontSize: 85.0,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                    Column(
                      children: [
                        SvgPicture.asset(
                          widget.weatherInfo.condition.imagePath,
                        ),
                        Text(
                          widget.weatherInfo.description,
                          style: GoogleFonts.lato(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Divider(
                      height: 15.0,
                      thickness: 2.0,
                      color: Colors.white30,
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        WeatherInfoBox(
                          title: 'AQI(대기질지수)',
                          valueIndicator: Image.asset(
                            widget.airInfo.condition.imagePath,
                            width: 37.0,
                            height: 35.0,
                          ),
                          unitString: widget.airInfo.condition.text,
                        ),
                        WeatherInfoBox(
                          title: '미세먼지',
                          valueIndicator: Text(
                            widget.airInfo.fineDust.toString(),
                            style: GoogleFonts.lato(
                              fontSize: 24.0,
                              color: Colors.white,
                            ),
                          ),
                          unitString: 'μg/m3',
                        ),
                        WeatherInfoBox(
                          title: '초미세먼지',
                          valueIndicator: Text(
                            widget.airInfo.ultraFineDust.toString(),
                            style: GoogleFonts.lato(
                              fontSize: 24.0,
                              color: Colors.white,
                            ),
                          ),
                          unitString: 'μg/m3',
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
