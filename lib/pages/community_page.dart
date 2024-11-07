import 'package:flutter/material.dart';
import '../components/place_info_card.dart';

class CommunityPage
    extends StatelessWidget {
  const CommunityPage({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double cardWidth =
        MediaQuery.of(context)
                .size
                .width *
            0.7;
    final int index =
        0; // Define the index variable

    return Scaffold(
      backgroundColor:
          const Color(0xFFF5F5F5),
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            SizedBox(
              height: 250,
              child: Padding(
                padding:
                    const EdgeInsets
                        .symmetric(
                        horizontal:
                            10.0),
                child: PlaceInfoCard(
                  openingHours:
                      '08:00 am - 02:00 pm',
                  location: 'Barcelona',
                  description:
                      'testing testing 1 2 3',
                  index: index,
                  width: cardWidth,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
