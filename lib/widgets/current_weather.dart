import 'package:flutter/material.dart';
import 'package:weather_application/models/current_weather_data.dart';
import 'package:weather_application/utils/custom_colors.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final CurrentWeatherData currentWeatherData;
  const CurrentWeatherWidget({super.key, required this.currentWeatherData});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height * 1;
    final screenWidth = MediaQuery.of(context).size.width * 1;
    return Column(
      children: [
        // temperature area
        temperatureAreaWidget(),
        // more detail i-e wind speed, humidity, clouds
        currentWeatherMoreDetailWidget(screenWidth, screenHeight),
      ],
    );
  }

  Widget currentWeatherMoreDetailWidget(
    double screenHeight,
    double screenWidth,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          'assets/weather/${currentWeatherData.current.weather![0].icon}.png',
          height: screenHeight * 0.2,
          width: screenWidth * 0.1,
        ),
        Container(
          height: screenHeight * 0.14,
          width: screenWidth * 0.004,
          color: CustomColors.dividerLine,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "${currentWeatherData.current.temp!.toInt()}°C",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 68,
                  color: CustomColors.textColorBlack,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget temperatureAreaWidget() {
    return Text('');
  }
}
