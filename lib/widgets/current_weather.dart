import 'package:flutter/material.dart';
import 'package:weather_application/models/current_weather_data.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final CurrentWeatherData currentWeatherData;
  const CurrentWeatherWidget({super.key, required this.currentWeatherData});

  @override
  Widget build(BuildContext context) {
    return Container(
    child: Text(currentWeatherData.current.temp.toString())
    );
  }
}
