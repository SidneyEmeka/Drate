import 'package:drate/functions/fetchrates.dart';
import 'package:drate/models/allrates.dart';
import 'package:drate/widgets/vtwo.dart';
import 'package:flutter/material.dart';

import '../widgets/vone_scroll.dart';


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
          top: 10,

        ),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: FutureBuilder<Allrates>(
              future: result,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting ) {
                  return Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        backgroundColor: Colors.black,
                      ),
                    ],
                  ));
                }
                if (snapshot.hasError) {
                  return const Center(
                    child: Text(
                      "Unable to Connect",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.deepOrange),
                    ),
                  );
                }
                return Center(
                  child: FutureBuilder<Map>(
                    future: allcurrencies,
                    builder: (context, currSnapshot) {
                      if (currSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(
                                backgroundColor: Colors.black,
                              ),
                            ],
                          ),
                        );
                      }
                      if (snapshot.hasError) {
                        return const Center(
                          child: Text(
                            "Unable to Connect",
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.deepOrange),
                          ),
                        );
                      }
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          VoneScroll(rates: snapshot.data!.rates,
                              currencies: currSnapshot.data!),
                          Container(
                            width: w,
                            padding: EdgeInsets.symmetric(
                                horizontal: 2, vertical: 2),
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.black,
                              ),
                              color: Colors.white,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                "assets/images/gifs.GIF",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),


                          Vtwo(
                              rates: snapshot.data!.rates,
                              currencies: currSnapshot.data!),
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
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
                                      "Drate aggregates and weighs exchange rates from popular exchanges for this conversion. This is for informational purpose only",
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
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
