import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:weather_app/modules/home/home_bindings.dart';
import 'package:weather_app/modules/home/home_page.dart';
import 'package:weather_app/modules/modules.dart';


class HomeModule extends Module{
  @override
  List<GetPage>routers = [
    GetPage(
        name: '/home',
        page: () => HomePage(),
        binding: HomeBinding()
    ),
  ];
}
