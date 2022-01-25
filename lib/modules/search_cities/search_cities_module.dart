import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:weather_app/modules/modules.dart';
import 'package:weather_app/modules/search_cities/search_cities_bindings.dart';
import 'package:weather_app/modules/search_cities/search_cities_page.dart';


class SearchCitiesModule extends Module{
  @override
  List<GetPage>routers = [
    GetPage(
        name: '/search_cities',
        page: () => SearchCitiesPage(),
        binding: SearchCitiesBinding()
    ),
  ];
}