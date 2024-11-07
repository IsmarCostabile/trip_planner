import 'package:flutter/material.dart';

class PlaceInfoModal
    extends StatelessWidget {
  final int index;
  final String description;
  final String location;
  final String openingHours;

  const PlaceInfoModal({
    Key? key,
    required this.index,
    required this.description,
    required this.location,
    required this.openingHours,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.only(
              topLeft:
                  Radius.circular(15.0),
              topRight:
                  Radius.circular(15.0),
            ),
            child: Image.network(
              'https://barcelonahacks.com/wp-content/uploads/2022/05/casa-batllo-facade-1041x651.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 120,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.all(
                    8.0),
            child: Text(
              'Place ${index + 1}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight:
                    FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets
                .symmetric(
                horizontal: 8.0),
            child: Text(
              description,
              style: const TextStyle(
                  fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets
                .symmetric(
                horizontal: 8.0,
                vertical: 4.0),
            child: Text(
              'Location: $location',
              style: const TextStyle(
                  fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets
                .symmetric(
                horizontal: 8.0,
                vertical: 4.0),
            child: Text(
              'Opening Hours: $openingHours',
              style: const TextStyle(
                  fontSize: 14),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.all(
                    8.0),
            child: Text(
              'This is a longer description that provides more detailed information about the place. It can include historical facts, interesting anecdotes, and other relevant details that make the place worth visiting. This extended description helps users understand why the place is significant and what they can expect when they visit.',
              style: const TextStyle(
                  fontSize: 14),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.all(
                    8.0),
            child: ElevatedButton(
              onPressed: () {
                // Add functionality to add the place to the itinerary
              },
              child: const Text(
                  'Add to Itinerary'),
            ),
          ),
        ],
      ),
    );
  }
}
