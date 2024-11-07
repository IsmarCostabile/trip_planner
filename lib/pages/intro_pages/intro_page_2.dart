import 'package:flutter/material.dart';
import 'package:trip_planner/pages/navigation_page.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NavigationPage(),
              ),
            ),
          },
          child: const Text('Go to: Home Page'),
        ),
      ),
    );
  }
}
