import 'package:drate/pages/material_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:drate/pages/cupertino_page.dart';


void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MatHomePage(),
    );
  }
}

class MyCupApp extends StatelessWidget {
  const MyCupApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: CupHomePage(),
    );
  }
}
