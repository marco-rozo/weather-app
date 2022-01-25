import 'package:weather_app/models/countries_model.dart';

abstract class SearchCitiesRepository {
  Future<List<CountriesModel?>> getAllCountries();
}
