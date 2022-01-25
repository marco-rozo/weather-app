import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather_weekly_model.dart';

import 'day_week_weathe_more_info_page.dart';

class CardWeatherWeekly extends StatelessWidget {
  final WeatherWeeklyModel? weatherWeekly;

  const CardWeatherWeekly({
    Key? key,
    required this.weatherWeekly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NumberFormat formatter = NumberFormat("00.0");
    String _temp_formatter_max = formatter.format(weatherWeekly?.temp_max);
    String _temp_formatter_min = formatter.format(weatherWeekly?.temp_min);

    return InkWell(
      onTap: () => Get.to(
        DayWeekWeatherInfoPage(weatherWeekly: weatherWeekly),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.grey.shade300.withOpacity(0.4),
        ),
        constraints: BoxConstraints(minWidth: 100),
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(right: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "${weatherWeekly?.day_of_the_week}",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Center(
                child: Image(
                  image: AssetImage(
                    'assets/images/${weatherWeekly?.icon}.png',
                    // 'assets/icon/app_icon.png',
                  ),
                  // Icon(
                  //   Icons.wb_sunny, color: Colors.yellow,
                  // ),
                  height: 30,
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.north,
                  color: Colors.white,
                  size: 14,
                ),
                Text(
                  "${_temp_formatter_max}°",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.south,
                  color: Colors.white,
                  size: 14,
                ),
                Text(
                  "${_temp_formatter_min}°",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
