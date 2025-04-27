import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_application/api/fetch_weather.dart';
import 'package:weather_application/models/weather_data.dart';

class GlobalController extends GetxController {
  // create variables
  final RxBool _isloading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longtitude = 0.0.obs;

  // instance for them to be called
  RxBool checkLoading() => _isloading;
  RxDouble getLatutude() => _latitude;
  RxDouble getLongtitude() => _longtitude;

  final weatherData = WeatherData().obs;
  getWeatherData() => weatherData.value;

  @override
  void onInit() {
    if (_isloading.isTrue) {
      getLocation();
    }

    super.onInit();
  }

  getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;
    // return if service is enabled

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    // return if service is not enabled
    if (!isServiceEnabled) {
      return Get.snackbar('Permission', 'Permission is not enabled');
    }

    // return the current status is device has functionality of location
    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Get.snackbar('Permission', 'Permission is denied forever');
    } else if (locationPermission == LocationPermission.denied) {
      // ask for permission
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Get.snackbar('Permission', 'Permission is denied');
      }
    }

    // getting the current location of user
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    ).then((value) {
      // update lattitude & longtitude
      _latitude.value = value.latitude;
      _longtitude.value = value.longitude;
      print(value.altitude);
      print(value.longitude);

      // When we will know our current location we will be calling our API
      return FetchWeather().processData(value.latitude, value.longitude).then((
        value,
      ) {
        weatherData.value = value;
        _isloading.value = false;
      });
    });
  }
}
