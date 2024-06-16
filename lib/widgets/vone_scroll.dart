import 'package:drate/servers/utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../functions/fetchrates.dart';

class VoneScroll extends StatefulWidget {
  const VoneScroll({Key? key, required this.rates, required this.currencies})
      : super(key: key);

  final rates;
  final Map currencies;

  @override
  State<VoneScroll> createState() => _VoneScrollState();
}

class _VoneScrollState extends State<VoneScroll> {
  Widget sideSpace(double value) {
    return SizedBox(
      width: value,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
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
      child: ListView(
        reverse: false,
        scrollDirection: Axis.horizontal,
        children: [
          Text(
            "USD/NGN " + baseValue(widget.rates, "1", "USD", "NGN"),
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          sideSpace(10),
          Text(
            "USD/GHC " + baseValue(widget.rates, "1", "USD", "GHS"),
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          sideSpace(10),
          Text(
            "EUR/NGN " + baseValue(widget.rates, "1", "EUR", "NGN"),
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          sideSpace(10),
          Text(
            "GHC/NGN " + baseValue(widget.rates, "1", "GHS", "NGN"),
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          sideSpace(10),
          Text(
            "CAD/NGN " + baseValue(widget.rates, "1", "CAD", "NGN"),
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          sideSpace(10),
          Text(
            "EUR/USD " + baseValue(widget.rates, "1", "EUR", "USD"),
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          sideSpace(10),
          Text(
            "BTC/NGN " + baseValue(widget.rates, "1", "BTC", "NGN"),
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          sideSpace(10),
          Text(
            "GBP/NGN " + baseValue(widget.rates, "1", "GBP", "NGN"),
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          sideSpace(10),
          Text(
            "USD/JPY " + baseValue(widget.rates, "1", "USD", "JPY"),
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          sideSpace(10),
          Text(
            "USD/INR " + baseValue(widget.rates, "1", "USD", "INR"),
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          sideSpace(10),
        ],
      ),
    );
  }
}
