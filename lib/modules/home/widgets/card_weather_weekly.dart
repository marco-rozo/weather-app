import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather_weekly_model.dart';

class CardWeatherWeekly extends StatelessWidget {
  final WeatherWeeklyModel? weatherWeekly;

  const CardWeatherWeekly({Key? key, required this.weatherWeekly})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    NumberFormat formatter = NumberFormat("00.0");
    String tempFormatter = formatter.format(weatherWeekly?.temp_day);
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.only(right: 12.0),
        constraints: BoxConstraints(minWidth: 80),
        child: Column(
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
            Text(
              "${tempFormatter}°",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
