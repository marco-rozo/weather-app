import 'package:weather_app/models/countries_model.dart';

abstract class SearchCitiesService {
  Future<List<CountriesModel?>> getAllCountries();
}