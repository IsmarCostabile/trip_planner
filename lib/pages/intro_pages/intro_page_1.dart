import 'package:flutter/material.dart';
import 'package:trip_planner/pages/intro_pages/intro_page_2.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const IntroPage2(),
              ),
            ),
          },
          child: const Text('Go to: Intro Page 2'),
        ),
      ),
    );
  }
}
