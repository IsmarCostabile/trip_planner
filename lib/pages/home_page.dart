import 'package:flutter/material.dart';
import 'package:trip_planner/components/container_bubble.dart';
import 'package:trip_planner/components/place_info_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double cardWidth =
        MediaQuery.of(context)
                .size
                .width *
            0.7;

    return Scaffold(
      backgroundColor:
          const Color(0xFFF5F5F5),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title:
                const Text('Home Page'),
            floating: true,
            snap: true,
            backgroundColor:
                const Color(0xFFF5F5F5),
          ),
          SliverList(
            delegate:
                SliverChildListDelegate(
              [
                Container(
                  padding:
                      const EdgeInsets
                          .all(16.0),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .start,
                    children: [
                      const Text(
                        'Recently Looked At Items',
                        style:
                            TextStyle(
                          fontSize: 18,
                          fontWeight:
                              FontWeight
                                  .bold,
                          color: Color(
                              0xFF071013),
                        ),
                      ),
                      SizedBox(
                        height:
                            250, // Set a fixed height for the ListView
                        child: ListView
                            .builder(
                          scrollDirection:
                              Axis.horizontal,
                          itemCount: 3,
                          itemBuilder:
                              (context,
                                  index) {
                            return Padding(
                              padding: const EdgeInsets
                                  .symmetric(
                                  horizontal:
                                      5.0),
                              child:
                                  PlaceInfoCard(
                                openingHours:
                                    '08:00 am - 02:00 pm',
                                location:
                                    'Barcelona',
                                description:
                                    'testing testing 1 2 3',
                                index:
                                    index,
                                width:
                                    cardWidth,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
