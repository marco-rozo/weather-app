import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:weather_app/models/weather_current_model.dart';
import 'package:weather_app/modules/home/widgets/weather_today/card_weather_today_more_info.dart';
import 'package:weather_app/modules/home/widgets/weather_today/current_info_weather.dart';
import 'package:weather_app/modules/home/widgets/weather_today/title_weather_today.dart';

class WeatherToday extends StatelessWidget {
  final WeatherCurrentModel? weatherCurrent;

  const WeatherToday({Key? key, required this.weatherCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "${weatherCurrent?.date_format.toString()}",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        CurrentInfoWeather(
          weatherCurrent: weatherCurrent,
        ),
        CardWeathertTodayMoreInfos(
          weatherCurrent: weatherCurrent,
        ),
      ],
    );
  }
}
