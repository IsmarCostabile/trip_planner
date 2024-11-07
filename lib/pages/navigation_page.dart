import 'package:trip_planner/components/nav_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:trip_planner/components/nav_bar/custom_navigation_bar.dart';
import 'package:trip_planner/pages/community_page.dart';
import 'package:trip_planner/pages/home_page.dart';
import 'package:trip_planner/pages/intro_pages/intro_page_1.dart';
import 'package:trip_planner/pages/intro_pages/intro_page_2.dart';
import 'package:trip_planner/pages/itinirary_view.dart';
import 'package:trip_planner/pages/profile_page.dart';
import 'package:trip_planner/pages/locations_list.dart';

class NavigationPage
    extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() =>
      _NavigationPageState();
}

class _NavigationPageState
    extends State<NavigationPage> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // pages to display
  final List<Widget> _pages = [
    const HomePage(),
    const CommunityPage(),
    LocationsList(),
    const ItiniraryView(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          CustomNavigationBar(
        color: Color(0xFFE84855),
        backgroundColor:
            const Color(0xFFF5F5F5),
        animationDuration:
            const Duration(
                milliseconds: 200),
        items: const <Widget>[
          Icon(Icons.home_sharp,
              size: 30,
              color: Color(0xFF071013)),
          Icon(Icons.people,
              size: 30,
              color: Color(0xFF071013)),
          Icon(Icons.list_rounded,
              size: 30,
              color: Color(0xFF071013)),
          Icon(Icons.map,
              size: 30,
              color: Color(0xFF071013)),
          Icon(Icons.person,
              size: 30,
              color: Color(0xFF071013))
        ],
        onTap: (index) =>
            navigateBottomBar(index),
      ),
      // Hex Color F15946
      body: Container(
          child:
              _pages[_selectedIndex]),
    );
  }
}
