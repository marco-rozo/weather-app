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
            //dropdown button in Ui
            Obx(() {
              return controller.allCountries.length > 0 ||
                      controller.countriesName.length > 0
                  ? Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey.shade300.withOpacity(0.4),
                      ),
                      child: DropdownButton<String>(
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: 'Poppins',
                        ),
                        dropdownColor: Colors.grey.shade300.withOpacity(0.9),
                        value: controller.valueSelectedCountrie.value,
                        items: controller.countriesName.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                decoration: TextDecoration.none,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          controller.setSelected(newValue.toString());
                        },
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
