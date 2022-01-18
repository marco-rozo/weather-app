import 'package:weather_app/models/weather_weekly_model.dart';
import 'package:weather_app/repositories/weather_weekly/weather_weekly_repository.dart';
import 'package:weather_app/services/weather_weekly/weather_weekly_service.dart';

class WeatherWeeklyServiceImpl implements WeatherWeeklyService {
      final WeatherWeeklyRepository _weatherWeeklyRepository;

  WeatherWeeklyServiceImpl({
    required WeatherWeeklyRepository weatherWeeklyRepository,
  }) : _weatherWeeklyRepository = weatherWeeklyRepository;

  @override
  Future<List<WeatherWeeklyModel?>> getWeatherWeekly(String lat , String long) => 
      _weatherWeeklyRepository.getWeatherWeekly(lat, long);

}
