import 'package:flutter/material.dart';
import 'package:weather_app/data/my_location.dart';
import 'package:weather_app/data/network.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late final double latitude;
  late final double longitude;
  late final weatherData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude = myLocation.myLatitude;
    longitude = myLocation.myLongitude;
    print(latitude);
    print(longitude);

    Network network = Network(
        url:
            'https://samples.openweathermap.org/data/2.5/weather?q=London&appid=b1b15e88fa797225412429c1c50c122a1');
    weatherData = await network.getJsonData();
    print(weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
