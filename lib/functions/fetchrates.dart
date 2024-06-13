import 'package:http/http.dart' as http;
import '../models/allcurrencies.dart';
import '../models/allrates.dart';
import '../servers/utility.dart';

Future<Allrates> fetchrates() async {
  final response = await http.get(
      Uri.parse("https://openexchangerates.org/api/latest.json?app_id=$key"));
  print(response.body);
  final result = allratesFromJson(response.body);
  return result;
}

Future<Map> fetchcurrencies() async {
  final response = await http.get(
    Uri.parse(
        "https://openexchangerates.org/api/currencies.json?app_id=8e49a62018704aca8e10947cc794d7e6"),
  );
  final allcurrencies = allcurrenciesFromJson(response.body);
  return allcurrencies;
}

//To get the base(1) value of any currency in Vone
String baseValue(
    Map exchangerates, String amount, String currencybase, currencyfinal) {
  String output = ((double.parse(amount) / exchangerates[currencybase]) *
          exchangerates[currencyfinal])
      .toStringAsFixed(2)
      .toString();
  return output;
}

//Converter fuunction for vtwo
String convertAny(
    Map exchangerates, String amount, String currencybase, currencyfinal) {
  String output = ((double.parse(amount) / exchangerates[currencybase]) *
          exchangerates[currencyfinal])
      .toStringAsFixed(2)
      .toString();
  return output;
}
