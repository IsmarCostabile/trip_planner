import 'package:flutter/material.dart';
import 'place_info_modal.dart';

class PlaceInfoCard
    extends StatefulWidget {
  final int index;
  final double width;
  final String description;
  final String location;
  final String openingHours;

  const PlaceInfoCard({
    Key? key,
    required this.index,
    required this.width,
    required this.description,
    required this.location,
    required this.openingHours,
  }) : super(key: key);

  @override
  _PlaceInfoCardState createState() =>
      _PlaceInfoCardState();
}

class _PlaceInfoCardState
    extends State<PlaceInfoCard> {
  final ScrollController
      _scrollController =
      ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController
        .addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(
        _scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    // Remove modal opening logic
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: 300,
      child: Card(
        color: const Color(0xFFF5F5F5),
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(
                  15.0),
        ),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment
                    .start,
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius
                        .only(
                  topLeft:
                      Radius.circular(
                          15.0),
                  topRight:
                      Radius.circular(
                          15.0),
                ),
                child: Image.network(
                  'https://barcelonahacks.com/wp-content/uploads/2022/05/casa-batllo-facade-1041x651.jpg',
                  fit: BoxFit.cover,
                  width:
                      double.infinity,
                  height: 120,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets
                        .all(8.0),
                child: Text(
                  'Place ${widget.index + 1}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight:
                        FontWeight.bold,
                    color: Color(
                        0xFF071013),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets
                        .symmetric(
                        horizontal:
                            8.0),
                child: Text(
                  widget.description,
                  style:
                      const TextStyle(
                          fontSize: 14),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets
                        .symmetric(
                        horizontal: 8.0,
                        vertical: 4.0),
                child: Text(
                  'Location: ${widget.location}',
                  style:
                      const TextStyle(
                          fontSize: 14),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets
                        .symmetric(
                        horizontal: 8.0,
                        vertical: 4.0),
                child: Text(
                  'Opening Hours: ${widget.openingHours}',
                  style:
                      const TextStyle(
                          fontSize: 14),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets
                        .all(8.0),
                child: Align(
                  alignment: Alignment
                      .centerRight,
                  child: ElevatedButton(
                    style:
                        ElevatedButton
                            .styleFrom(
                      foregroundColor:
                          Color(
                              0xFF071013),
                      backgroundColor:
                          Color(
                              0xFF86D5AD),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context:
                            context,
                        builder:
                            (context) =>
                                PlaceInfoModal(
                          index: widget
                              .index,
                          description:
                              widget
                                  .description,
                          location: widget
                              .location,
                          openingHours:
                              widget
                                  .openingHours,
                        ),
                      );
                    },
                    child: const Text(
                        '+ Itinerary'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
