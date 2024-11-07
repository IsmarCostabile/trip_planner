import 'package:flutter/material.dart';

class LocationWidget
    extends StatelessWidget {
  final String title;
  final List<String> imageUrls;
  final String openingTimes;
  final String price;
  final String distance;

  const LocationWidget({
    super.key,
    required this.title,
    required this.imageUrls,
    required this.openingTimes,
    required this.price,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin:
          const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          _buildImageCarousel(),
          Padding(
            padding:
                const EdgeInsets.all(
                    8.0),
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets
                .symmetric(
                horizontal: 8.0),
            child: Text(
                'Opening Times: $openingTimes'),
          ),
          Padding(
            padding: const EdgeInsets
                .symmetric(
                horizontal: 8.0),
            child:
                Text('Price: $price'),
          ),
          Padding(
            padding: const EdgeInsets
                .symmetric(
                horizontal: 8.0),
            child: Text(
                'Distance: $distance'),
          ),
        ],
      ),
    );
  }

  Widget _buildImageCarousel() {
    return SizedBox(
      height: 200.0,
      child: PageView.builder(
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return Image.network(
            imageUrls[index],
            fit: BoxFit.cover,
            width: double.infinity,
          );
        },
      ),
    );
  }
}
