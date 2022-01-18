import 'package:weather_app/models/weather_current_model.dart';

abstract class WeatherCurrentService {
  Future<WeatherCurrentModel?> getWeatherCurrent(String lat , String long);
}