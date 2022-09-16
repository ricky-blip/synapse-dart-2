import 'package:dart_flutter_state/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const DartFlutterState());
}

class DartFlutterState extends StatelessWidget {
  const DartFlutterState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
