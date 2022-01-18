import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:weather_app/application/ui/loader/loader_mixin.dart';
import 'package:weather_app/models/weather_current_model.dart';
import 'package:weather_app/models/weather_weekly_model.dart';
import 'package:weather_app/services/weather_current/weather_current_service.dart';
import 'package:weather_app/services/weather_weekly/weather_weekly_service.dart';

class HomeController extends GetxController with LoaderMixin {
  final WeatherCurrentService _weatherCurrentService;
  final WeatherWeeklyService _weatherWeeklyService;

  var loading = false.obs;
  var weatherCurrent = Rxn<WeatherCurrentModel>();
  //var weatherWeekly = Rxn<WeatherWeeklyModel>();
  final weatherWeekly = <WeatherWeeklyModel?>[].obs;


  HomeController({
    required WeatherCurrentService weatherCurrentService,
    required WeatherWeeklyService weatherWeeklyService,
  })  : _weatherCurrentService = weatherCurrentService,
        _weatherWeeklyService = weatherWeeklyService;

  @override
  void onInit() {
    super.onInit();
    //adiciona o loading na página
    loaderListener(loading);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      loading(true);
      final box = GetStorage();

      var latitude;
      var longitude;

      if (box.read('latitude') == null && box.read('latitude') == null) {
        Position resultPosition = await _getGeoLocationPosition();
        latitude = resultPosition.latitude.toString();
        longitude = resultPosition.longitude.toString();

        box.write('latitude', resultPosition.latitude.toString());
        box.write('longitude', resultPosition.longitude.toString());
      }

      latitude = box.read('latitude');
      longitude = box.read('longitude');

      final weatherCurrentData = await _weatherCurrentService.getWeatherCurrent(latitude, longitude);
      final weatherWeeklyData = await _weatherWeeklyService.getWeatherWeekly(latitude, longitude);

      weatherCurrent.value = weatherCurrentData;
      weatherWeeklyData.removeAt(0);
      weatherWeekly.assignAll(weatherWeeklyData);

      print('box.read(latitude)');
      print(latitude);
      print('box.read(longitude)');
      print(longitude);
      print(weatherCurrentData?.temp);
      print('weatherWeekly Controller');
      print(weatherWeekly);

      loading(false);
    } on Exception catch (e, s) {
      print(e);
      print(s);
      loading(false);
    }
  }

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Teste se os serviços de localização estão ativados.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Os serviços de localização não estão ativados,
      // trava a busca pela localização e solicita ao usuário do
      // App para habilitar os serviços de localização.
      await Geolocator.openLocationSettings();
      return Future.error('Os serviços de localização estão desativados.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('As permissões de localização foram negadas');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // As permissões são negadas para sempre, trate-as adequadamente.
      return Future.error(
          'As permissões de localização são negadas permanentemente, não podemos solicitar permissões.');
    }
    // Quando chegamos aqui, as permissões são concedidas e podemos
    // continuar acessando a localização do dispositivo.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
