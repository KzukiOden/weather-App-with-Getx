import 'package:weather_application/models/current_weather_data.dart';

class WeatherData {
  final CurrentWeatherData? current;
  
  WeatherData({this.current});

  // function to fetch the values
  CurrentWeatherData getCurrentWeather(){
    return current!;
  }
  
}
