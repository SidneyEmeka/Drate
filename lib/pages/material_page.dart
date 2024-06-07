import 'package:drate/widgets/currency_dropdown.dart';
import 'package:flutter/material.dart';

import '../functions/funcs.dart';
import '../servers/utility.dart';

//create STATE widget
class MatHomePage extends StatefulWidget {
  const MatHomePage({super.key});

  @override
  State<MatHomePage> createState() {
    return _MatHomePageState();
  }
}

//Extend State
class _MatHomePageState extends State<MatHomePage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  void convert() {
    setState(() {
      result = double.parse(textEditingController.text) * 1482.04;
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

late Future<Allrates> apiResult;
  late Future<Map> allcurrencies;
  final formkey = GlobalKey<FormState>();

  @override
 void initState() {
    super.initState();
   setState(() {
     apiResult = fetchrates();
     allcurrencies = fetchcurrencies();
   });
  }




  @override
  Widget build(BuildContext context) {
    var border = const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black38,
        width: 2.0,
        style: BorderStyle.none,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    );

    return Scaffold(
        backgroundColor: const Color.fromRGBO(31, 41, 55, 1),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(17, 24, 39, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text("Drate - Currency Converter",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white70,
              )),
          centerTitle: true,
          toolbarHeight: 25,
        ), //light blue grey for background
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "NGN - ₦${result != 0 ? result.toStringAsFixed(3) : result.toStringAsFixed(0)}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(17, 24, 39, 1),
                ),
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(5.0),

                //dark blue gray
                child: TextField(
                  controller: textEditingController,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    hintText: "USD - US Dollar",
                    hintStyle: const TextStyle(
                      color: Colors.white70,
                      fontSize: 10,
                    ),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 10, top: 8),
                      child: Text(
                        "\$",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                    prefixIconColor: Colors.white,
                    filled: true,
                    fillColor: const Color.fromRGBO(31, 41, 55, 1),
                    //dark blue gray for input area
                    focusedBorder: border,
                    enabledBorder: border,
                  ),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                ),
              ),

             const SizedBox(
                height: 20.0,
              ),


              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    convert();
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 15,
                    shadowColor: Colors.white70,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.white,
                    foregroundColor: const Color.fromRGBO(31, 41, 55, 1),
                    minimumSize: const Size(35, 35),
                  ),
                  child: const Text("Convert"),
                ),
              ),
            ],
          ),
        ));
  }
}
