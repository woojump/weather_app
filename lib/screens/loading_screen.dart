import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/data/network.dart';
import 'package:weather_app/data/repository/air_repository.dart';
import 'package:weather_app/data/repository/location_repository.dart';
import 'package:weather_app/data/repository/weather_repository.dart';
import 'package:weather_app/models/air_model.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/screens/error_screen.dart';
import 'package:weather_app/screens/weather_screen.dart';

const apiKey = 'c3ae04a10caa36641aac820113183e41';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late final LocationRepository _locationRepository;
  late final WeatherRepository _weatherRepository;
  late final AirRepository _airRepository;

  late Position? _myLocation;
  late WeatherInfo? _weatherInfo;
  late AirInfo? _airInfo;

  @override
  void initState() {
    super.initState();
    _locationRepository = LocationRepositoryImpl();
    _weatherRepository = WeatherRepositoryImpl(Network(), apiKey);
    _airRepository = AirRepositoryImpl(Network(), apiKey);
    getLocation();
  }

  Future getLocation() async {
    try {
      await Future.wait([]);

      // 현재 위치 정보를 리포지토리에서 가져옵니다.
      _myLocation = await _locationRepository.getMyCurrentLocation();
      if (_myLocation == null) throw Exception('내 위치를 가져오는 데 실패했습니다.');
      final double latitude = _myLocation!.latitude;
      final double longitude = _myLocation!.longitude;

      // 공기질 정보를 리포지토리에서 가져옵니다.
      _airInfo = await _airRepository.getAirInfo(latitude, longitude);
      if (_airInfo == null) throw Exception('공기질 정보를 가져오는 데 실패했습니다.');

      // 날씨 정보를 리포지토리에서 가져옵니다.
      _weatherInfo =
          await _weatherRepository.getWeatherInfo(latitude, longitude);
      if (_weatherInfo == null) throw Exception('날씨 정보를 가져오는 데 실패했습니다.');

      if (!mounted) return;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WeatherScreen(
            weatherInfo: _weatherInfo!,
            airInfo: _airInfo!,
          ),
        ),
      );
    } catch (e) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ErrorScreen(error: e),
        ),
      );
    }
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
          const Center(
            child: SpinKitDoubleBounce(
              color: Colors.white,
              size: 200.0,
            ),
          ),
        ],
      ),
    );
  }
}
