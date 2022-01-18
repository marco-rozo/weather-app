import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:weather_app/application/rest_client/rest_client.dart';
import 'package:weather_app/models/weather_weekly_model.dart';
import 'package:weather_app/repositories/weather_weekly/weather_weekly_repository.dart';

class WeatherWeeklyRepositoryImpl implements WeatherWeeklyRepository {
  final RestClient _restClient;

  WeatherWeeklyRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<List<WeatherWeeklyModel?>> getWeatherWeekly(String lat, String long) async {
    final result = await _restClient.get<List<WeatherWeeklyModel>>(
      '/onecall?',
      query: {
        'appid': RemoteConfig.instance.getString('api_key_openweathermap'),
        'lang': 'pt_br',
        'units': 'metric',
        'exclude': 'hourly,minutely',
        'lat': '-26.4783392',
        'lon': '-53.6857977',
      },
      decoder: (data) {
        //pega os dados do array "genres"
        final result = data['daily'];
        print('result = data[daily];');
        print(result);
        print('result = data[daily];');
        //verifica se tem dados
        if (result != null) {
          //transforma a lista de CHAVExVALOR (JSON) no model GenreModel
          return result
              .map<WeatherWeeklyModel>((w) => WeatherWeeklyModel.fromMap(w))
              .toList();
        } else {
          //se for vazio retorna nulo
          return <WeatherWeeklyModel>[];
        }
      },
    );

    //apos executar o acesso verifica se possui algumm erro
    if(result.hasError){
      print('Erro getWeatherWeekly [${result.statusText}]');
      throw Exception('Erro getWeatherWeekly');
    }

    return result.body ?? <WeatherWeeklyModel>[];
  }
}
