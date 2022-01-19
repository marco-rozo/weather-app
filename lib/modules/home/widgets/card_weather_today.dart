import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather_current_model.dart';

class CardWeathertToday extends StatelessWidget {
  final WeatherCurrentModel? weatherCurrent;

  const CardWeathertToday({Key? key, required this.weatherCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    NumberFormat formatter = NumberFormat("00.0");
    String tempFormatter = formatter.format(weatherCurrent?.temp);

    return Container(
      height: 180,
      margin: EdgeInsets.only(right: 22, left: 22, top: 12),
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Color(0xff6B83CD),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade900,
            offset: Offset(2, 2),
            blurRadius: 6,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-2, -2),
            blurRadius: 6,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned.fill(
            top: 22,
            left: 22,
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${tempFormatter}°",
                    style: TextStyle(
                      fontSize: 44,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "${weatherCurrent!.day_of_the_week}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
            left: 22,
            bottom: 22,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "${weatherCurrent!.city_name}",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned.fill(
            right: 22,
            bottom: 22,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "${weatherCurrent!.description}",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned.fill(
            right: 22,
            top: 10,
            child: Align(
              alignment: Alignment.topRight,
              child: Image(
                image: AssetImage(
                  'assets/images/${weatherCurrent!.icon}.png',
                ),
                height: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
