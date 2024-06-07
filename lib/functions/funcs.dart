import 'package:drate/servers/utility.dart';
import 'package:http/http.dart' as http;

//Get Currencies from the api
Future<Map> fetchcurrencies() async {
  var response = await http.get(Uri.parse(
    "https://openexchangerates.org/api/currencies.json?app_id=$key"
  ));
  final allcurrencies = allcurrenciesFromJson(response.body);
  return allcurrencies;
}

//Get Currencies from the api
Future<Allrates> fetchrates() async {
  var response = await http.get(Uri.parse(
    "https://openexchangerates.org/api/latest.json?app_id=$key"
  ));
  final apiResult = allratesFromJson(response.body);
  return apiResult;
}