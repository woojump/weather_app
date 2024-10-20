import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';

class WeatherScreen extends StatefulWidget {
  final dynamic parseWeatherData;

  const WeatherScreen({
    super.key,
    required this.parseWeatherData,
  });

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late String cityName;
  late int temperature;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateData(widget.parseWeatherData);
  }

  void updateData(dynamic weatherData) {
    cityName = weatherData['name'];
    double doubleTemperature = weatherData['main']['temp'];
    temperature = doubleTemperature.round();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.near_me),
          iconSize: 30.0,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.location_searching),
            iconSize: 30.0,
          ),
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            'image/background.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text('city'),
                    Row(
                      children: [
                        Text('time'),
                        Text('day'),
                        Text('date'),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text('temperature'),
                    Row(
                      children: [
                        Text('weatherImage'),
                        Text('description'),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Divider(
                      height: 15.0,
                      thickness: 2.0,
                      color: Colors.white30,
                    ),
                    Row(
                      children: [
                        Column(),
                        Column(),
                        Column(),
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
