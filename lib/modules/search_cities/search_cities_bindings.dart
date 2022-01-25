import 'package:get/get.dart';

import 'search_cities_controller.dart';

class SearchCitiesBinding implements Bindings {
  @override
  void dependencies() {
    //manter a controller ativa com "fenix: true"
    Get.lazyPut(
      () => SearchCitiesController(searchCitiesService: Get.find()),
    );
  }
}
