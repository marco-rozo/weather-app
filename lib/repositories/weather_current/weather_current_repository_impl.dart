import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:weather_app/application/rest_client/rest_client.dart';
import 'package:weather_app/models/weather_current_model.dart';
import 'package:weather_app/repositories/weather_current/weather_current_repository.dart';

class WeatherCurrentRepositoryImpl implements WeatherCurrentRepository {
  final RestClient _restClient;

  WeatherCurrentRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<WeatherCurrentModel?> getWeatherCurrent(String lat , String long) async {
    final result = await _restClient.get<WeatherCurrentModel?>('weather?', query: {
      'appid': RemoteConfig.instance.getString('api_key_openweathermap'),
      'lang': 'pt_br',
      'units': 'metric',
      'lat': '-26.4783392',
      'lon': '-53.6857977',
    }, decoder: (data) {
      print('decoder: (data)');
      print(data);
      return WeatherCurrentModel.fromMap(data);
    });

    if (result.hasError) {
      print('Erro getWeatherCurrent [${result.statusText}]');
      throw Exception('Erro getWeatherCurrent');
    }

    return result.body;
  }
}
