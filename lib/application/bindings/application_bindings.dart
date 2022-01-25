import 'package:get/get.dart';
import 'package:weather_app/application/rest_client/rest_client_cities.dart';
import 'package:weather_app/application/rest_client/rest_client_weather.dart';
import 'package:weather_app/modules/home/home_controller.dart';
import 'package:weather_app/repositories/search_cities/search_cities_repository.dart';
import 'package:weather_app/repositories/search_cities/search_cities_repository_impl.dart';
import 'package:weather_app/repositories/weather_current/weather_current_repository.dart';
import 'package:weather_app/repositories/weather_current/weather_current_repository_impl.dart';
import 'package:weather_app/repositories/weather_weekly/weather_weekly_repository.dart';
import 'package:weather_app/repositories/weather_weekly/weather_weekly_repository_impl.dart';
import 'package:weather_app/services/search_cities/search_cities_service.dart';
import 'package:weather_app/services/search_cities/search_cities_service_impl.dart';
import 'package:weather_app/services/weather_current/weather_current_service.dart';
import 'package:weather_app/services/weather_current/weather_current_service_impl.dart';
import 'package:weather_app/services/weather_weekly/weather_weekly_service.dart';
import 'package:weather_app/services/weather_weekly/weather_weekly_service_impl.dart';

class ApplicationBindings implements Bindings {
  //classes que "não" finalizam durante o tempo de vida da aplicação dado "fenix: true"

  @override
  void dependencies() {
    Get.lazyPut(
      () => RestClientWeather(),
      fenix: true,
    );

    Get.lazyPut(
      () => RestClientCities(),
      fenix: true,
    );

    Get.lazyPut<WeatherCurrentRepository>(
      () => WeatherCurrentRepositoryImpl(
        restClient: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<WeatherCurrentService>(
      () => WeatherCurrentServiceImpl(weatherCurrentepository: Get.find()),
      fenix: true,
    );

    Get.lazyPut<WeatherWeeklyRepository>(
      () => WeatherWeeklyRepositoryImpl(
        restClient: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<WeatherWeeklyService>(
      () => WeatherWeeklyServiceImpl(weatherWeeklyRepository: Get.find()),
      fenix: true,
    );

    Get.lazyPut<SearchCitiesRepository>(
      () => SearchCitiesRepositoryImpl(
        restClient: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<SearchCitiesService>(
      () => SearchCitiesServiceImpl(searchCitiesRepository: Get.find()),
      fenix: true,
    );

    //ao carregar a aplicação verifica se está logado ou nao (para fazer o direcionamento)
    // Get.put(AuthService()).init();
  }
}
