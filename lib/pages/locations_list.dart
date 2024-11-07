import 'package:flutter/material.dart';

class LocationsList
    extends StatelessWidget {
  const LocationsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFF5F5F5),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text(
                'Itinirary View'),
            backgroundColor:
                const Color(0xFFF5F5F5),
            floating: true,
            snap: true,
            pinned: false,
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate(
              (BuildContext context,
                  int index) {
                return ListTile(
                  title: Text(
                      'Item #$index text text text text text'),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
