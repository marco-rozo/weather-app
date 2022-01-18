import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class WeatherCurrentModel {
  final String title;
  final String description;
  final String icon;
  final double temp;
  final double feels_like;
  final double humidity;
  final String city_name;
  final String sunrise;
  final String sunset;
  final double wind_speed;
  final DateTime date;
  final String day_of_the_week;

  WeatherCurrentModel({
    required this.title,
    required this.description,
    required this.icon,
    required this.temp,
    required this.feels_like,
    required this.humidity,
    required this.city_name,
    required this.sunrise,
    required this.sunset,
    required this.wind_speed,
    required this.date,
    required this.day_of_the_week,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'icon': icon,
      'temp': temp,
      'feels_like': feels_like,
      'humidity': humidity,
      'cityName': city_name,
      'sunrise': sunrise,
      'sunset': sunset,
      'windSpeed': wind_speed,
      'date': date,
      'dayOfTheWeek': day_of_the_week,
    };
  }

  factory WeatherCurrentModel.fromMap(Map<String, dynamic> map) {
    initializeDateFormatting('pt_BR', null);
    
    String week_day = DateFormat(DateFormat.WEEKDAY, 'pt_BR')
        .format(DateTime.fromMillisecondsSinceEpoch(map['dt'] * 1000));

    String formatHour(int unixDate) {
      String hour = DateFormat(DateFormat.HOUR24_MINUTE, 'pt_BR')
          .format(DateTime.fromMillisecondsSinceEpoch(unixDate * 1000));

      return hour;
    }

    return WeatherCurrentModel(
      title: map['weather'][0]['main'] ?? '',
      description: toBeginningOfSentenceCase(
              map['weather'][0]['description'].toString()) ??
          '',
      icon: map['weather'][0]['icon'] ?? '',
      temp: map['main']['temp']?.toDouble() ?? 0.0,
      feels_like: map['main']['feels_like']?.toDouble() ?? 0.0,
      humidity: map['main']['humidity']?.toDouble() ?? 0.0,
      city_name: map['name'] ?? '',
      sunrise: formatHour(map['sys']['sunrise']),
      sunset: formatHour(map['sys']['sunset']),
      wind_speed: map['wind']['windSpeed']?.toDouble() ?? 0.0,
      date: DateTime.fromMillisecondsSinceEpoch(map['dt'] * 1000),
      day_of_the_week: toBeginningOfSentenceCase(week_day).toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherCurrentModel.fromJson(String source) =>
      WeatherCurrentModel.fromMap(json.decode(source));
}
