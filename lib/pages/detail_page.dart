import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final int placeIndex;

  const DetailPage({Key? key, required this.placeIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Place ${placeIndex + 1} Details'),
      ),
      body: Center(
        child: Text('Details for Place ${placeIndex + 1}'), // Replace with actual place details
      ),
    );
  }
}
