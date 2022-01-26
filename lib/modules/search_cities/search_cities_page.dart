import 'package:dropdown_search2/dropdown_search2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:weather_app/application/ui/weather_app_ui_config.dart';
import 'package:weather_app/modules/search_cities/search_cities_controller.dart';

class SearchCitiesPage extends GetView<SearchCitiesController> {
  const SearchCitiesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.toNamed('/home'),
        ),
        automaticallyImplyLeading: false,
        title: Text('Adicionar nova cidade'),
        elevation: 0,
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          gradient: WeatherAppUIConfig.linearGradient,
        ),
        child: Column(
          children: [
            Obx(() {
              return controller.allCountries.length > 0 ||
                      controller.countriesName.length > 0
                  ? Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      margin:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey.shade300.withOpacity(0.5),
                      ),
                      child: DropdownSearch<String>(
                        mode: Mode.BOTTOM_SHEET,
                        showSelectedItems: true,
                        items: controller.countriesName,
                        label: "Paises",
                        hint: "Selecione o pais",
                        onChanged: (newValue) {
                          controller.setSelected(newValue.toString());
                        },
                        // selectedItem: controller.valueSelectedCountrie.value,
                        showSearchBox: true,
                        showClearButton: true,
                        dropdownSearchDecoration: InputDecoration(
                            fillColor: Colors.transparent,
                            filled: true,
                            contentPadding: EdgeInsets.only(
                                bottom: 10.0, left: 10.0, right: 10.0),
                            labelText: "Paises",
                            labelStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 0.5),
                            ),
                            hoverColor: Colors.white),
                      ),
                    )
                  : Container();
            }),
          ],
        ),
      ),
    );
  }
}
