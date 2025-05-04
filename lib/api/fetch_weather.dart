import 'dart:convert';
import 'package:weather_application/models/current_weather_data.dart';
import 'package:weather_application/models/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:weather_application/utils/api_url.dart';

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

