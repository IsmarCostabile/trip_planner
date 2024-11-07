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
          const SliverAppBar(
            title: _AppBarTitle(),
            floating: true,
            snap: true,
            backgroundColor:
                Color(0xFFF5F5F5),
            automaticallyImplyLeading:
                false,
          ),
          SliverList(
            delegate:
                SliverChildListDelegate(
              [
                Padding(
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
                        height: 285,
                        child: ListView
                            .builder(
                          scrollDirection:
                              Axis.horizontal,
                          itemCount: 6,
                          itemBuilder:
                              (context,
                                  index) {
                            return Padding(
                              padding: const EdgeInsets
                                  .symmetric(
                                  horizontal:
                                      0.0),
                              child:
                                  PlaceInfoCard(
                                stars:
                                    index,
                                price:
                                    '8-20€',
                                openingHours:
                                    '08:00 am - 02:00 pm',
                                title:
                                    'Place test $index',
                                description:
                                    'This is a description for place number $index. It is a wonderful place to visit with many attractions and activities to enjoy.',
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

class _AppBarTitle
    extends StatelessWidget {
  const _AppBarTitle();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.explore,
          color: Colors.black,
        ),
        SizedBox(width: 8),
        Text(
          'Trip Planner',
          style: TextStyle(
              fontWeight:
                  FontWeight.bold),
        ),
        Spacer(),
        Flexible(
          flex: 7,
          child: TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: 'Search',
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  EdgeInsets.symmetric(
                      horizontal: 8.0),
              border:
                  OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(
                        Radius.circular(
                            20.0)),
                borderSide:
                    BorderSide.none,
              ),
              suffixIcon:
                  Icon(Icons.search),
            ),
          ),
        ),
      ],
    );
  }
}
