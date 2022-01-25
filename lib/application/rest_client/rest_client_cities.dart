import 'package:get/get.dart';

class RestClientCities extends GetConnect{

  RestClientCities(){
    httpClient.baseUrl = 'http://battuta.medunes.net/api/';
  }
  
}