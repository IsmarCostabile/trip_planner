import 'package:flutter/material.dart';
import 'package:trip_planner/pages/intro_pages/intro_page_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage1(),
    );
  }
}
