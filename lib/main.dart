import 'package:calls/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Calling App',
      home: Homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
