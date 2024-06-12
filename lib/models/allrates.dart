import 'dart:convert';

//json rates api converted to dart
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
