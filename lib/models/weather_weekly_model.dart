import 'dart:convert';

import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class WeatherWeeklyModel {
  final String day_of_the_week;
  final String date_format;
  final String sunrise;
  final String sunset;
  final double temp_day;
  final double temp_min;
  final double temp_max;
  final double temp_night;
  final double feels_like_day;
  final double feels_like_night;
  final double humidity;
  final String title;
  final String description;
  final String icon;
  final double wind_speed;
  final int clouds;
  final int pressure;

  WeatherWeeklyModel({
    required this.day_of_the_week,
    required this.date_format,
    required this.sunrise,
    required this.sunset,
    required this.temp_day,
    required this.temp_min,
    required this.temp_max,
    required this.temp_night,
    required this.feels_like_day,
    required this.feels_like_night,
    required this.humidity,
    required this.title,
    required this.description,
    required this.icon,
    required this.wind_speed,
    required this.clouds,
    required this.pressure,
  });

  Map<String, dynamic> toMap() {
    return {
      'day_of_the_week': day_of_the_week,
      'date_format': date_format,
      'sunrise': sunrise,
      'sunset': sunset,
      'temp_day': temp_day,
      'temp_min': temp_min,
      'temp_max': temp_max,
      'temp_night': temp_night,
      'feels_like_day': feels_like_day,
      'feels_like_night': feels_like_night,
      'humidity': humidity,
      'title': title,
      'description': description,
      'icon': icon,
      'wind_speed': wind_speed,
      'clouds': clouds,
      'pressure': pressure,
    };
  }

  factory WeatherWeeklyModel.fromMap(Map<String, dynamic> map) {
    initializeDateFormatting('pt_BR', null);
    
    String week_day = DateFormat(DateFormat.WEEKDAY, 'pt_BR')
        .format(DateTime.fromMillisecondsSinceEpoch(map['dt'] * 1000));

    String formatHour(int unixDate) {
      String hour = DateFormat(DateFormat.HOUR24_MINUTE, 'pt_BR')
          .format(DateTime.fromMillisecondsSinceEpoch(unixDate * 1000));
      return hour;
    }

    String formatDate(int unixDate) {
      String date = DateFormat(DateFormat.MONTH_DAY, 'pt_BR')
          .format(DateTime.fromMillisecondsSinceEpoch(unixDate * 1000));
      date = toBeginningOfSentenceCase(date).toString();
      return date;
    }

    return WeatherWeeklyModel(
      day_of_the_week: toBeginningOfSentenceCase(week_day.replaceAll('-feira', '').toUpperCase()).toString(),
      sunrise: formatHour(map['sunrise']),
      sunset: formatHour(map['sunset']),
      temp_day: map['temp']['day']?.toDouble() ?? 0.0,
      temp_min: map['temp']['min']?.toDouble() ?? 0.0,
      temp_max: map['temp']['max']?.toDouble() ?? 0.0,
      temp_night: map['temp']['night']?.toDouble() ?? 0.0,
      feels_like_day: map['feels_like']['day']?.toDouble() ?? 0.0,
      feels_like_night: map['feels_like']['night']?.toDouble() ?? 0.0,
      humidity: map['humidity']?.toDouble() ?? 0.0,
      title: map['weather'][0]['main'] ?? '',
      description: toBeginningOfSentenceCase(map['weather'][0]['description']) ?? '',
      icon: map['weather'][0]['icon'] ?? '',
      wind_speed: map['wind_speed']?.toDouble() ?? 0.0,
      date_format: formatDate(map['dt']),
      clouds: map['clouds'],
      pressure: map['pressure'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherWeeklyModel.fromJson(String source) => WeatherWeeklyModel.fromMap(json.decode(source));
}
