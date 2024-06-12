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
               bottom: 5,
             ),
             child: const Text("Drate - Currency Converter",
                 style: TextStyle(
                   fontSize: 15,
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
          builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(child: const CircularProgressIndicator());
          }
                return Center(
                child: FutureBuilder<Map>(
                  future: allcurrencies,
                  builder: (context, currSnapshot){
                    if(currSnapshot.connectionState == ConnectionState.waiting){
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Column(
                      children: [
                       // Vone(rates: snapshot.data!.rates, currencies: currSnapshot.data!),
                       //  SizedBox(
                       //    height: 40,
                       //  ),
                        Vtwo(rates: snapshot.data!.rates, currencies: currSnapshot.data!),

                      ],
                    );
                  },
                )
                );
          },

            ),
          ),
        ),
      ),);
  }
}
