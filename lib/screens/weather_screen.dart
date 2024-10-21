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
  var date = DateTime.now();

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

  String getSystemTime() {
    var now = DateTime.now();
    return DateFormat('h:mm a').format(now);
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
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                const Column(
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
                const Column(
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
