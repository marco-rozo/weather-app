import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:weather_app/application/rest_client/rest_client_cities.dart';
import 'package:weather_app/models/countries_model.dart';
import 'package:weather_app/repositories/search_cities/search_cities_repository.dart';

class SearchCitiesRepositoryImpl implements SearchCitiesRepository {
  final RestClientCities _restClient;

  SearchCitiesRepositoryImpl({
    required RestClientCities restClient,
  }) : _restClient = restClient;

  @override
  Future<List<CountriesModel?>> getAllCountries() async {
    final result = await _restClient.get<List<CountriesModel>>(
      'country/all/?',
      query: {
        'key': RemoteConfig.instance.getString('api_key_countries'),
      },
      decoder: (data) {
        //pega os dados do array "daily"
        final result = data;
        //verifica se tem dados
        if (result != null) {
          //transforma a lista de CHAVExVALOR (JSON) no model CountriesModel
          return result
              .map<CountriesModel>((w) => CountriesModel.fromMap(w))
              .toList();
        } else {
          //se for vazio retorna nulo
          return <CountriesModel>[];
        }
      },
    );

    //apos executar o acesso verifica se possui algumm erro
    if (result.hasError) {
      print('Erro getAllCountries [${result.statusText}]');
      throw Exception('Erro getAllCountries');
    }

    return result.body ?? <CountriesModel>[];
  }
}
