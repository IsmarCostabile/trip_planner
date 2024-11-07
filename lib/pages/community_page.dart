import 'package:flutter/material.dart';
import 'package:trip_planner/components/location_widget/location_widget.dart';

class CommunityPage
    extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor:
          Color(0xFFF5F5F5),
      body: Center(
        child: LocationWidget(
          
            title: 'test',
            imageUrls: [
              'https://www.google.com/url?sa=i&url=https%3A%2F%2Ftiptoeingworld.com%2F2018%2F01%2Fcasa-batllo-is-the-entrance-ticket-worth-paying%2F&psig=AOvVaw1SoR4uVGw_YGYeSUFCPjKR&ust=1730741274909000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCODbtejXwIkDFQAAAAAdAAAAABAJ'
            ],
            openingTimes: '8am-9pm',
            price: '10€',
            distance: '5km'),
      ),
    );
  }
}
