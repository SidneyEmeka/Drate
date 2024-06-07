//Added Http package in pubspec.yaml
import 'dart:convert';

//api key
const String key = "8e49a62018704aca8e10947cc794d7e6";


//json currencies api to dart
Map<String, String> allcurrenciesFromJson(String str) => Map.from(json.decode(str)).map((k, v) => MapEntry<String, String>(k, v));

String allcurrenciesToJson(Map<String, String> data) => json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v)));




//json rates api to dart
Allrates allratesFromJson(String str) => Allrates.fromJson(json.decode(str));

String allratesToJson(Allrates data) => json.encode(data.toJson());

class Allrates {
  String disclaimer;
  String license;
  int timestamp;
  String base;
  Map<String, double> rates;

  Allrates({
    required this.disclaimer,
    required this.license,
    required this.timestamp,
    required this.base,
    required this.rates,
  });

  factory Allrates.fromJson(Map<String, dynamic> json) => Allrates(
    disclaimer: json["disclaimer"],
    license: json["license"],
    timestamp: json["timestamp"],
    base: json["base"],
    rates: Map.from(json["rates"]).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "disclaimer": disclaimer,
    "license": license,
    "timestamp": timestamp,
    "base": base,
    "rates": Map.from(rates).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}
