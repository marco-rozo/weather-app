import 'dart:ui';

import 'package:flutter/material.dart';

class WeatherAppUIConfig {
  WeatherAppUIConfig._();

  static String get title => 'Weathher App';

  static LinearGradient get linearGradient => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomRight,
        stops: [0.4, 3],
        colors: [Color(0xFF2F80ED), Color(0xFF56CCF2)],
      );

  static ThemeData get theme => ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Color(0xFF2F80ED),
          backwardsCompatibility: false,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
}
