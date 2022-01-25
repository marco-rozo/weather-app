import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/application/ui/weather_app_ui_config.dart';
import 'package:weather_app/models/weather_weekly_model.dart';

class DayWeekWeatherInfoPage extends StatelessWidget {
  final WeatherWeeklyModel? weatherWeekly;

  const DayWeekWeatherInfoPage({Key? key, required this.weatherWeekly})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    NumberFormat humidity_formatter = NumberFormat("00");
    NumberFormat temp_formatter = NumberFormat("00.0");
    NumberFormat formatter = NumberFormat("00.0");

    String _temp_formatter_max = formatter.format(weatherWeekly?.temp_max);
    String _temp_formatter_min = formatter.format(weatherWeekly?.temp_min);
    String _humidity = humidity_formatter.format(weatherWeekly?.humidity);
    String _temp_feels_like_day =
        temp_formatter.format(weatherWeekly?.feels_like_day);
    String _temp_feels_like_night =
        temp_formatter.format(weatherWeekly?.feels_like_night);

    return Scaffold(
      appBar: AppBar(
        title: Text("${weatherWeekly?.date_format}"),
        elevation: 0,
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          gradient: WeatherAppUIConfig.linearGradient,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 12,
            ),
            Image(
              image: AssetImage(
                'assets/images/${weatherWeekly!.icon}.png',
              ),
              height: 100,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.north,
                  color: Colors.white,
                ),
                RichText(
                  text: TextSpan(
                    text: "${_temp_formatter_max}",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                    ),
                    children: [
                      TextSpan(
                        text: '°',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 24,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    height: 30,
                    child: VerticalDivider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                  ),
                ),
                Icon(
                  Icons.south,
                  color: Colors.white,
                ),
                RichText(
                  text: TextSpan(
                    text: "${_temp_formatter_min}",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                    ),
                    children: [
                      TextSpan(
                        text: '°',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 24,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "${weatherWeekly?.description}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.w300,
                fontFamily: 'Poppins',
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 22, left: 22, top: 22),
              padding: EdgeInsets.all(25),
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.grey.shade300.withOpacity(0.4),
                boxShadow: [],
              ),
              child: Column(
                children: [
                  Row(
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
                              "${weatherWeekly?.sunrise}h",
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
                              "${weatherWeekly?.wind_speed}m/s",
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
                              "${weatherWeekly?.sunset}h",
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
                              "${weatherWeekly?.clouds}%",
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
                              "${weatherWeekly?.pressure}mbar",
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
                  Divider(
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sensação térmica dia: ',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "${weatherWeekly?.temp_day}°C",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sensação térmica noite: ',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "${weatherWeekly?.temp_night}°C",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
