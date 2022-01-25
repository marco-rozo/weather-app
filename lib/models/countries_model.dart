import 'dart:convert';

class CountriesModel {
  final String name;
  final String code;
  
  CountriesModel({
    required this.name,
    required this.code,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'code': code,
    };
  }

  factory CountriesModel.fromMap(Map<String, dynamic> map) {
    return CountriesModel(
      name: map['name'] ?? '',
      code: map['code'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CountriesModel.fromJson(String source) => CountriesModel.fromMap(json.decode(source));
}
