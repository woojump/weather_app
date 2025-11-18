import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather_info_display_model.dart';

class WeatherScreen extends StatefulWidget {
  final dynamic parseWeatherData;
  final dynamic parseAirData;

  const WeatherScreen({
    super.key,
    required this.parseWeatherData,
    required this.parseAirData,
  });

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen>
    with WeatherInfoDisplayModel {
  late String cityName;
  var date = DateTime.now();
  late int temperature;
  late int weatherCondition;
  late Widget weatherIcon;
  late String description;
  late int airCondition;
  late Widget airIcon;
  late String airState;
  late double fineDust;
  late double ultraFineDust;

  @override
  void initState() {
    super.initState();
    updateData(
      weatherData: widget.parseWeatherData,
      airData: widget.parseAirData,
    );
  }

  void updateData({dynamic weatherData, dynamic airData}) {
    cityName = weatherData['name'];
    double doubleTemperature = weatherData['main']['temp'];
    temperature = doubleTemperature.round();
    temperature = weatherData['main']['temp'].round();

    weatherCondition = weatherData['weather'][0]['id'];
    weatherIcon = getWeatherIcon(weatherCondition);
    description = weatherData['weather'][0]['description'];

    airCondition = airData['list'][0]['main']['aqi'];
    airIcon = getAirIcon(airCondition);
    airState = getAirState(airCondition);

    fineDust = airData['list'][0]['components']['pm2_5'];
    ultraFineDust = airData['list'][0]['components']['pm10'];
  }

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
            'image/background.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 100.0, 30.0, 100.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      cityName,
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
                          DateFormat(' - EEEE, d MMM, yyy').format(date),
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
                      '$temperature\u2103',
                      style: GoogleFonts.lato(
                        fontSize: 85.0,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                    Column(
                      children: [
                        weatherIcon,
                        Text(
                          description,
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
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'AQI(대기질지수)',
                              style: GoogleFonts.lato(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            airIcon,
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              airState,
                              style: GoogleFonts.lato(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '미세먼지',
                              style: GoogleFonts.lato(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              '$fineDust',
                              style: GoogleFonts.lato(
                                fontSize: 24.0,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'μg/m3',
                              style: GoogleFonts.lato(
                                fontSize: 16.0,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '초미세먼지',
                              style: GoogleFonts.lato(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              '$ultraFineDust',
                              style: GoogleFonts.lato(
                                fontSize: 24.0,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'μg/m3',
                              style: GoogleFonts.lato(
                                fontSize: 16.0,
                                color: Colors.black87,
                              ),
                            ),
                          ],
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
