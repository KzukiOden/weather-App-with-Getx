import 'dart:convert';

import 'package:weather_application/api/api_key.dart';
import 'package:weather_application/models/current_weather_data.dart';
import 'package:weather_application/models/weather_data.dart';
import 'package:http/http.dart' as http;

class FetchWeather {
  WeatherData? weatherData;

  // process the data from responce -> jyson
  Future<WeatherData> processData(lat, lon) async {
    var responce = await http.get(Uri.parse(fetchAPIUrl(lat, lon)));
    var jsonSting = jsonDecode(responce.body);
    weatherData = WeatherData(current: CurrentWeatherData.fromJson(jsonSting));
    // print(weatherData!.current!.temp); 
    return weatherData!;
  }
}

String fetchAPIUrl(var lat, var lon) {
  String url;
  url =
      'https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$apiKey';
  return url;
}
