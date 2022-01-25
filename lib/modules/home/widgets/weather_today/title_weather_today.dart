import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_current_model.dart';

class TitleWeatherToday extends StatelessWidget {
  final WeatherCurrentModel? weatherCurrent;

  const TitleWeatherToday({Key? key, required this.weatherCurrent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Text(
        //   "${weatherCurrent?.city_name.toString()}",
        //   style: TextStyle(
        //     color: Colors.white,
        //     fontSize: 26,
        //     fontWeight: FontWeight.bold
        //   ),
        // ),
        
      ],
    );
  }
}