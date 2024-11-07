import 'package:flutter/material.dart';
import 'dart:async';

class PlaceInfoModal
    extends StatefulWidget {
  final int index;
  final String title; // Add title field
  final String description;
  final String openingHours;
  final String price;
  final int currentImageIndex;
  final List<String> imageUrls;

  const PlaceInfoModal({
    Key? key,
    required this.index,
    required this.title, // Add title field
    required this.description,
    required this.openingHours,
    required this.price,
    required this.currentImageIndex,
    required this.imageUrls,
  }) : super(key: key);

  @override
  _PlaceInfoModalState createState() =>
      _PlaceInfoModalState();
}

class _PlaceInfoModalState
    extends State<PlaceInfoModal> {
  late Timer _timer;
  late int _currentImageIndex;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _currentImageIndex =
        widget.currentImageIndex;
    _pageController = PageController(
        initialPage:
            _currentImageIndex);
    _timer = Timer.periodic(
        Duration(seconds: 5), (timer) {
      setState(() {
        _currentImageIndex =
            (_currentImageIndex + 1) %
                widget.imageUrls.length;
        _pageController.animateToPage(
          _currentImageIndex,
          duration:
              Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context)
              .size
              .height *
          0.925, // Set height to 80% of the screen
      padding: const EdgeInsets.all(
          16.0), // Add padding
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Expanded(
            child:
                SingleChildScrollView(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment
                        .start,
                children: [
                  ClipRRect(
                    borderRadius:
                        const BorderRadius
                            .only(
                      topLeft: Radius
                          .circular(
                              15.0),
                      topRight: Radius
                          .circular(
                              15.0),
                    ),
                    child: SizedBox(
                      height:
                          250, // Increase the height of the image container
                      child: PageView
                          .builder(
                        controller:
                            _pageController,
                        itemCount: widget
                            .imageUrls
                            .length,
                        itemBuilder:
                            (context,
                                index) {
                          return Image
                              .network(
                            widget.imageUrls[
                                index],
                            fit: BoxFit
                                .cover,
                            width: double
                                .infinity,
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets
                            .symmetric(
                            vertical:
                                8.0),
                    child: Text(
                      widget
                          .title, // Use title field
                      style:
                          const TextStyle(
                        fontSize:
                            28, // Increase font size
                        fontWeight:
                            FontWeight
                                .bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets
                            .symmetric(
                            vertical:
                                4.0),
                    child: Row(
                      children: [
                        Icon(
                            Icons
                                .access_time,
                            size:
                                20), // Increase icon size
                        SizedBox(
                            width:
                                8), // Increase spacing
                        Text(widget
                            .openingHours),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets
                            .symmetric(
                            vertical:
                                4.0),
                    child: Row(
                      children: [
                        Icon(
                            Icons
                                .attach_money,
                            size:
                                20), // Increase icon size
                        SizedBox(
                            width:
                                8), // Increase spacing
                        Text(widget
                            .price),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets
                            .symmetric(
                            vertical:
                                4.0),
                    child: Text(
                      widget
                          .description,
                      style: const TextStyle(
                          fontSize:
                              18), // Increase font size
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets
                .symmetric(
                vertical: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton
                      .icon(
                    icon: Icon(
                        Icons.close),
                    label:
                        Text('Cancel'),
                    style:
                        ElevatedButton
                            .styleFrom(
                      backgroundColor:
                          Colors.grey,
                      foregroundColor:
                          const Color(
                              0xFF071013),
                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius
                                .circular(
                                    15.0), // Same radius as the modal
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(
                              context)
                          .pop(); // Close the modal
                    },
                  ),
                ),
                SizedBox(
                    width:
                        16), // Space between buttons
                Expanded(
                  child: ElevatedButton
                      .icon(
                    icon:
                        Icon(Icons.add),
                    label: Text('Add'),
                    style:
                        ElevatedButton
                            .styleFrom(
                      backgroundColor:
                          Color(
                              0xFF86D5AD),
                      foregroundColor:
                          const Color(
                              0xFF071013),
                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius
                                .circular(
                                    15.0), // Same radius as the modal
                      ),
                    ),
                    onPressed: () {
                      print(
                          'clicked button number: ${widget.index}');
                    },
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
