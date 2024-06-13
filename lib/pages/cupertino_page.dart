// import 'package:flutter/cupertino.dart';
//
// class CupHomePage extends StatefulWidget {
//   const CupHomePage({super.key});
//
//   @override
//   State<CupHomePage> createState() => _CupHomePageState();
// }
//
// class _CupHomePageState extends State<CupHomePage> {
//   double result = 0;
//   final TextEditingController textEditingController = TextEditingController();
//
//   void convert() {
//     setState(() {
//       result = double.parse(textEditingController.text)  * 1487.04;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//
//     return CupertinoPageScaffold(
//         backgroundColor: const Color.fromRGBO(31, 41, 55, 1),
//         navigationBar: const CupertinoNavigationBar(
//           backgroundColor:  Color.fromRGBO(17, 24, 39, 1),
//           middle:  Text("Drate - Currency Converter",
//               style: TextStyle(
//                 fontSize: 15,
//                 fontWeight: FontWeight.bold,
//                 color: CupertinoColors.systemGrey5,
//               ),
//           ),
//         ),//light blue grey for background
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text("NGN - ₦${ result != 0 ? result.toStringAsFixed(3): result.toStringAsFixed(0)}",
//                 style: const TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w400,
//                   color: CupertinoColors.systemGrey5,
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.all(20),
//                 margin: const EdgeInsets.all(5.0),
//                 color: const Color.fromRGBO(17, 24, 39, 1), //dark blue gray
//                 child: CupertinoTextField(
//                   controller: textEditingController,
//                   placeholder: "USD - U Dollar",
//                   placeholderStyle: const TextStyle(
//                     color: Color.fromRGBO(31, 41, 55, 1),
//                     fontSize: 10,
//                   ),
//                   prefix: const Padding(
//                     padding:  EdgeInsets.only(left: 10),
//                     child:  Text("\$",
//                       style: TextStyle(
//                         fontSize: 10,
//                         fontWeight: FontWeight.w600,
//                         color: Color.fromRGBO(31, 41, 55, 1),
//                       ),
//                     ),
//                   ),
//                   style: const TextStyle(
//                     color: Color.fromRGBO(31, 41, 55, 1),
//                   ),
//                   decoration:  BoxDecoration(
//                     color: CupertinoColors.systemGrey6,
//                     border: Border.all(
//                       color: CupertinoColors.darkBackgroundGray,),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   keyboardType: const TextInputType.numberWithOptions(
//                     decimal: true,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: CupertinoButton(
//                   onPressed: () {
//                     convert();
//                   },
//                   color: CupertinoColors.white,
//                   borderRadius: BorderRadius.circular(10),
//                   child: const Text("Convert",
//                   style: TextStyle(
//                     color: Color.fromRGBO(31, 41, 55, 1),
//                   ),),
//                 ),
//                 ),
//
//             ],
//           ),
//         ));
//   }
// }
