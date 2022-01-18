import 'package:weather_app/models/weather_current_model.dart';
import 'package:weather_app/repositories/weather_current/weather_current_repository.dart';
import 'package:weather_app/services/weather_current/weather_current_service.dart';

class WeatherCurrentServiceImpl implements WeatherCurrentService {
      final WeatherCurrentRepository _weatherCurrentepository;

  WeatherCurrentServiceImpl({
    required WeatherCurrentRepository weatherCurrentepository,
  }) : _weatherCurrentepository = weatherCurrentepository;

  @override
  Future<WeatherCurrentModel?> getWeatherCurrent(String lat , String long) => 
      _weatherCurrentepository.getWeatherCurrent(lat, long);

}
