import 'package:get/get.dart';

import 'home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    //manter a HomeController ativa com "fenix: true"
    Get.lazyPut(() => HomeController(
        weatherCurrentService: Get.find(), weatherWeeklyService: Get.find()));
  }
}
