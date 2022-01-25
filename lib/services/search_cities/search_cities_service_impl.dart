import 'package:weather_app/models/countries_model.dart';
import 'package:weather_app/repositories/search_cities/search_cities_repository.dart';
import 'package:weather_app/services/search_cities/search_cities_service.dart';

class SearchCitiesServiceImpl implements SearchCitiesService {
  final SearchCitiesRepository _searchCitiesRepository;

  SearchCitiesServiceImpl({
    required SearchCitiesRepository searchCitiesRepository,
  }) : _searchCitiesRepository = searchCitiesRepository;

  @override
  Future<List<CountriesModel?>> getAllCountries() =>
      _searchCitiesRepository.getAllCountries();
}
