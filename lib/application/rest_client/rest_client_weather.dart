import 'package:get/get.dart';

class RestClientWeather extends GetConnect{

  RestClientWeather(){
    httpClient.baseUrl = 'https://api.openweathermap.org/data/2.5/';
  }
  
}