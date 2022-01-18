import 'package:get/get.dart';
import 'package:weather_app/application/rest_client/rest_client.dart';
import 'package:weather_app/repositories/weather_current/weather_current_repository.dart';
import 'package:weather_app/repositories/weather_current/weather_current_repository_impl.dart';
import 'package:weather_app/repositories/weather_weekly/weather_weekly_repository.dart';
import 'package:weather_app/repositories/weather_weekly/weather_weekly_repository_impl.dart';
import 'package:weather_app/services/weather_current/weather_current_service.dart';
import 'package:weather_app/services/weather_current/weather_current_service_impl.dart';
import 'package:weather_app/services/weather_weekly/weather_weekly_service.dart';
import 'package:weather_app/services/weather_weekly/weather_weekly_service_impl.dart';

class ApplicationBindings implements Bindings {
  //classes que "não" finalizam durante o tempo de vida da aplicação dado "fenix: true"

  @override
  void dependencies() {
    Get.lazyPut(
      () => RestClient(),
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

    //ao carregar a aplicação verifica se está logado ou nao (para fazer o direcionamento)
    // Get.put(AuthService()).init();
  }
}
