import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:weather_app/application/ui/loader/loader_mixin.dart';
import 'package:weather_app/models/countries_model.dart';
import 'package:weather_app/services/search_cities/search_cities_service.dart';

class SearchCitiesController extends GetxController with LoaderMixin {
  final SearchCitiesService _searchCitiesService;
  var loading = false.obs;
  final box = GetStorage();
  final allCountries = <CountriesModel?>[].obs;

  List<String> countriesName = [];
  final valueSelectedCountrie = ''.obs;

  SearchCitiesController({
    required SearchCitiesService searchCitiesService,
  }) : _searchCitiesService = searchCitiesService;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loaderListener(loading);
    restoreListCountries();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    loading(true);
    restoreListCountries();

    try {
      if (countriesName.length < 0) {
        //pega os dados da api
        final allCountriesData = await _searchCitiesService.getAllCountries();
        //passa os dados pra lista
        allCountries.assignAll(allCountriesData);
        //percore a lista e adiciona na nova lista apenas os nomes
        allCountries.forEach((item) {
          countriesName.add(item!.name.toString());
        });

        //salva a lista com o GetStorage para nao precisar consumir sempre a api
        box.write('storageListCountries', countriesName);
      }

      //seta como valor selecionado o primeiro item da lista
      setSelected(countriesName.first);

      loading(false);
    } on Exception catch (e, s) {
      print(e);
      print(s);
      loading(false);
    }
  }

  void setSelected(String value) {
    valueSelectedCountrie.value = value;
  }

  void restoreListCountries() {
    List<dynamic> storageList = box.read('storageListCountries');

    if (storageList.length > 0) {
      List<String> listCopy = [];

      storageList.forEach((item) {
        //percore a lista e adiciona na nova lista apenas os nomes
        listCopy.add(item.toString());
      });

      countriesName.assignAll(listCopy);
    }
  }
}
