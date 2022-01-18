import 'package:get/get.dart';

class RestClient extends GetConnect{

  RestClient(){
    httpClient.baseUrl = 'https://api.openweathermap.org/data/2.5/';
  }

  
}