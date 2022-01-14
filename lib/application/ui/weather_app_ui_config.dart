import 'dart:ui';

import 'package:flutter/material.dart';

class WeatherAppUIConfig {
  WeatherAppUIConfig._();

  static String get title => 'Weathher App';

  static ThemeData get theme => ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Color(0xff8575D8),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Color(0xff8575D8),
          backwardsCompatibility: false,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          /*textTheme: TextTheme(
            bodyText1: TextStyle(
              color: Colors.white,
            ),
            bodyText2: TextStyle(
              color: Colors.white,
            ),
          ),*/
        ),
      );
}
