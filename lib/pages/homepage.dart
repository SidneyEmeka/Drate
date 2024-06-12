import 'package:drate/functions/fetchrates.dart';
import 'package:drate/models/allrates.dart';
import 'package:drate/vone.dart';
import 'package:drate/vtwo.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<Allrates> result;
  late Future<Map> allcurrencies;
  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    result = fetchrates();
    allcurrencies = fetchcurrencies();
  }

  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
            //borderRadius: BorderRadius.circular(20),
            ),
        title: Padding(
          padding: EdgeInsets.only(
            bottom: 0,
          ),
          child: const Text("Drate",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )),
        ),
        centerTitle: true,
        toolbarHeight: 40,
      ),
      body: Container(
        color: Colors.white,
        height: h,
        width: w,
        padding: EdgeInsets.only(
          top: 65,
          left: 20,
          right: 20,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: FutureBuilder<Allrates>(
              future: result,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: const CircularProgressIndicator());
                }
                return Center(
                    child: FutureBuilder<Map>(
                  future: allcurrencies,
                  builder: (context, currSnapshot) {
                    if (currSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return Column(
                      children: [
                        Vtwo(
                            rates: snapshot.data!.rates,
                            currencies: currSnapshot.data!),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          // width: w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.info_outline,
                                  color: Colors.grey.shade800,
                                  size: 20,
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    "Drate aggregates and weighs rates from popular exchanges for this conversion. This is for informational purpose only",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ));
              },
            ),
          ),
        ),
      ),
    );
  }
}
