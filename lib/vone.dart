// import 'package:flutter/material.dart';
//
// import 'functions/fetchrates.dart';
//
// class Vone extends StatefulWidget {
//   const Vone({Key? key, required this.rates, required this.currencies})
//       : super(key: key);
//
//   final rates;
//   final Map currencies;
//
//   @override
//   State<Vone> createState() => _VoneState();
// }
//
// class _VoneState extends State<Vone> {
//   TextEditingController usdController = TextEditingController();
//   String dropdownvalue = "NGN";
//   String result = "Converted Currency";
//
//   @override
//   Widget build(BuildContext context) {
//     var w = MediaQuery.of(context).size.width;
//
//     return Card(
//       color: Colors.black,
//       child: Container(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               alignment: Alignment.center,
//               child: const Text(
//                 "Usd to any",
//                 style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             TextFormField(
//               key: const Key("USD"),
//               controller: usdController,
//               cursorColor: Colors.white,
//               style: const TextStyle(color: Colors.white),
//               decoration: const InputDecoration(
//                 hintText: "Enter Amount in USD",
//                 hintStyle: TextStyle(
//                   color: Colors.grey,
//                 ),
//               ),
//               keyboardType: TextInputType.number,
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   child: DropdownButton<String>(
//                     dropdownColor: Colors.grey.shade900,
//                     value: dropdownvalue,
//                     style: const TextStyle(color: Colors.white),
//                     icon: const Icon(Icons.arrow_drop_down_circle_outlined, color: Colors.white,),
//                     iconSize: 24,
//                     elevation: 16,
//                     isExpanded: true,
//                     underline: Container(
//                       height: 2,
//                         color: Colors.grey.shade400,
//                     ),
//                     onChanged: (String? newValue){
//                       setState(() {
//                         dropdownvalue = newValue!;
//                       });
//                     },
//                     items: widget.currencies.keys.toSet().toList().map<DropdownMenuItem<String>>((value){
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Container(
//                   child: ElevatedButton(
//                     onPressed: (){
//                       setState(() {
//                         result = usdController.text +
//                             ' USD    =    ' +
//                             convertUsd(widget.rates, usdController.text,
//                                 dropdownvalue) +
//                             ' ' +
//                             dropdownvalue;
//                       });
//                     },
//                     child: const Text("Convert"),
//                     style: ElevatedButton.styleFrom(
//                     elevation: 15,
//                     shadowColor: Colors.grey,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     backgroundColor: Colors.deepOrange,
//                     foregroundColor: Colors.white,
//                     minimumSize: const Size(35, 35),
//                   ),
//                   ),
//                 )
//               ],
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             Container(
//               child: Text(result, style: TextStyle(
//                 color: Colors.white,
//               ),),
//
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
