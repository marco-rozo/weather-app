import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/application/ui/weather_app_ui_config.dart';
import 'package:weather_app/models/weather_current_model.dart';

class CardWeathertTodayMoreInfos extends StatelessWidget {
  final WeatherCurrentModel? weatherCurrent;

  const CardWeathertTodayMoreInfos({Key? key, required this.weatherCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    NumberFormat humidity_formatter = NumberFormat("00");
    NumberFormat temp_formatter = NumberFormat("00.0");
    String _humidity = humidity_formatter.format(weatherCurrent?.humidity);
    String _temp_feels_like = temp_formatter.format(weatherCurrent?.feels_like);

    return Container(
      margin: EdgeInsets.only(right: 22, left: 22, top: 22),
      padding: EdgeInsets.all(25),
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.grey.shade300.withOpacity(0.4),
        boxShadow: [
          // BoxShadow(
          //   color: Colors.grey.shade900,
          //   offset: Offset(2, 2),
          //   blurRadius: 6,
          //   spreadRadius: 1,
          // ),
          // BoxShadow(
          //   color: Colors.white,
          //   offset: Offset(-2, -2),
          //   blurRadius: 6,
          //   spreadRadius: 1,
          // ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nascer do sol',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "${weatherCurrent?.sunrise}h",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Sensação térmica',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "${_temp_feels_like}ºC",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Humidade',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "${_humidity}%",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Vel. do vento',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "${weatherCurrent?.wind_speed}m/s",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Por do sol',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "${weatherCurrent?.sunset}h",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Nuvens',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "${weatherCurrent?.clouds}%",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Pressão',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "${weatherCurrent?.pressure}mbar",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
