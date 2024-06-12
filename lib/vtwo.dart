import 'package:flutter/material.dart';

import 'functions/fetchrates.dart';

class Vtwo extends StatefulWidget {
  const Vtwo({Key? key, required this.rates, required this.currencies})
      : super(key: key);

  final rates;
  final Map currencies;

  @override
  State<Vtwo> createState() => _VtwoState();
}

class _VtwoState extends State<Vtwo> {
  TextEditingController amountController = TextEditingController();
  String dropdownvalue1 = "NGN";
  String dropdownvalue2 = "USD";
  String result = "...";

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    return Card(
      color: Colors.black,
      child: Container(
        padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/drate.png",
                    width: 30,
                  ),
                  Text(
                    "Drate",
                    style: TextStyle(
                        color: Colors.orange.shade600,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              key: const Key("USD"),
              controller: amountController,
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: "Enter Amount",
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    dropdownColor: Colors.grey.shade900,
                    value: dropdownvalue1,
                    icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                    iconSize: 24,
                    style: const TextStyle(color: Colors.black),
                    elevation: 16,
                    isExpanded: true,
                    underline: Container(
                      height: 2,
                      color: Colors.grey.shade400,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue1 = newValue!;
                      });
                    },
                    items: widget.currencies.keys
                        .toSet()
                        .toList()
                        .map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child:
                            Text(value, style: TextStyle(color: Colors.white)),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text('To',
                        style: TextStyle(color: Colors.white))),
                Expanded(
                  child: DropdownButton<String>(
                    dropdownColor: Colors.grey.shade900,
                    value: dropdownvalue2,
                    icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                    style: const TextStyle(color: Colors.black),
                    iconSize: 24,
                    elevation: 16,
                    isExpanded: true,
                    underline: Container(
                      height: 2,
                      color: Colors.grey.shade400,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue2 = newValue!;
                      });
                    },
                    items: widget.currencies.keys
                        .toSet()
                        .toList()
                        .map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child:
                            Text(value, style: TextStyle(color: Colors.white)),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    result = amountController.text +
                        " " +
                        dropdownvalue1 +
                        "  =  " +
                        convertAny(widget.rates, amountController.text,
                            dropdownvalue1, dropdownvalue2) +
                        " " +
                        dropdownvalue2;
                  });
                },
                child: const Text("Convert"),
                style: ElevatedButton.styleFrom(
                  elevation: 15,
                  shadowColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(35, 35),
                ),
              ),
            ),
            // const SizedBox(
            //   height: 15,
            //),
            Container(
              alignment: Alignment.center,
              child: Text(
                result,
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
            ),
            Container(
              child: Row(
                children: [
                  Expanded(flex: 1,
                    child: Icon(Icons.info_outline,
                      color: Colors.white70,),

                  ),
                  Expanded(flex: 4,
                    child: Text("Drate aggregates and weighs exchanges from popular exchanges for this conversion. This is for informational purpose only",
                      style: TextStyle(
                        color: Colors.white70,
                      ),),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
