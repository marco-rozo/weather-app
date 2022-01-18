import 'package:weather_app/models/weather_weekly_model.dart';

abstract class WeatherWeeklyService {
  Future<List<WeatherWeeklyModel?>> getWeatherWeekly(String lat , String long);
}