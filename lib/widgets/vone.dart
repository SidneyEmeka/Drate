import 'package:flutter/material.dart';

import '../functions/fetchrates.dart';

class Vone extends StatefulWidget {
  const Vone({Key? key, required this.rates, required this.currencies})
      : super(key: key);

  final rates;
  final Map currencies;

  @override
  State<Vone> createState() => _VoneState();
}

class _VoneState extends State<Vone> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: 10,
      ),
      margin: EdgeInsets.only(
        bottom: 15,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
      width: w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              "USD/NGN " + baseValue(widget.rates, "1", "USD", "NGN"),
              style: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              "EUR/NGN " + baseValue(widget.rates, "1", "EUR", "NGN"),
              style: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              "BTC/NGN " + baseValue(widget.rates, "1", "BTC", "NGN"),
              style: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
