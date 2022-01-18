import 'dart:ui';

import 'package:flutter/material.dart';

class WeatherAppUIConfig {
  WeatherAppUIConfig._();

  static String get title => 'Weathher App';

  static ThemeData get theme => ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Color(0xff6370BC),
        // scaffoldBackgroundColor: Color(0xff6C7FCC),
        // scaffoldBackgroundColor: Color(0xff827FDC),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Color(0xff6370BC),
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
