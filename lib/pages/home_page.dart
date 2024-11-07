import 'package:flutter/material.dart';
import 'package:trip_planner/components/container_bubble.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                        height: 150,
                        child: ListView
                            .builder(
                          scrollDirection:
                              Axis.horizontal,
                          itemCount:
                              10, // Replace with the actual number of items
                          itemBuilder:
                              (context,
                                  index) {
                            return ContainerBubble(
                              child: Text(
                                  'test'),
                            ); // Replace with your actual widget
                          },
                        ),
                      ),
                      const SizedBox(
                          height:
                              16.0), // Add spacing between sections
                      const Text(
                        'Locations',
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
                        height: 150,
                        child: ListView
                            .builder(
                          scrollDirection:
                              Axis.horizontal,
                          itemCount:
                              10, // Replace with the actual number of items
                          itemBuilder:
                              (context,
                                  index) {
                            return ContainerBubble(
                              child: Text(
                                  'test'),
                            ); // Replace with your actual widget
                          },
                        ),
                      ),
                      // Add more sections here as needed
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
