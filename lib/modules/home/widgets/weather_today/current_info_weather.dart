import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather_current_model.dart';

class CurrentInfoWeather extends StatelessWidget {
  final WeatherCurrentModel? weatherCurrent;

  const CurrentInfoWeather({Key? key, required this.weatherCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    NumberFormat formatter = NumberFormat("00.0");
    String tempFormatter = formatter.format(weatherCurrent?.temp);

    return Column(
      children: [
        SizedBox(
          height: 12,
        ),
        Image(
          image: AssetImage(
            'assets/images/${weatherCurrent!.icon}.png',
          ),
          height: 100,
        ),
        SizedBox(
          height: 12,
        ),
        RichText(
          text: TextSpan(
            text: "${tempFormatter}",
            style: TextStyle(
                fontSize: 44,
                fontWeight: FontWeight.w300,
                color: Colors.white,
                fontFamily: 'Poppins'),
            children: [
              TextSpan(
                text: '°',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 38,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        ),
        Text(
          "${weatherCurrent?.description}",
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.normal
          ),
        ),
      ],
    );
  }
}
