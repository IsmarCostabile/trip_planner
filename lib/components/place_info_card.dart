import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'place_info_modal.dart';
import 'dart:async';

class PlaceInfoCard
    extends StatefulWidget {
  final int index;
  final double width;
  final String title;
  final String description;
  final String openingHours;
  final String price;
  final int? stars; // Make stars field optional
  final bool isFirst;
  final bool isLast;

  const PlaceInfoCard({
    Key? key,
    required this.index,
    required this.width,
    required this.title,
    required this.description,
    required this.openingHours,
    required this.price,
    this.stars, // Make stars field optional
    this.isFirst = false,
    this.isLast = false,
  }) : super(key: key);

  @override
  _PlaceInfoCardState createState() =>
      _PlaceInfoCardState();
}

class _PlaceInfoCardState
    extends State<PlaceInfoCard> {
  late Timer _timer;
  int _currentImageIndex = 0;
  bool _isVisible = false;
  final List<String> _imageUrls = [
    'https://d3dqioy2sca31t.cloudfront.net/Projects/cms/production/000/020/484/original/d0531471711b367b94abfd4dbc29e6ae/spain-barcelona-sagrada-familia-080416-az.jpg',
    'https://barcelonahacks.com/wp-content/uploads/2022/05/casa-batllo-facade-1041x651.jpg',
    'https://plus.unsplash.com/premium_photo-1697729758146-9aa25d423094?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YmFyY2Vsb25hfGVufDB8fDB8fHww',
  ];

  @override
  void initState() {
    super.initState();
    _startImageTimer();
  }

  void _startImageTimer() {
    _timer = Timer.periodic(
        Duration(seconds: 5), (timer) {
      if (_isVisible && mounted) {
        setState(() {
          _currentImageIndex =
              (_currentImageIndex + 1) %
                  _imageUrls.length;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _openModal() {
    _timer.cancel();
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) =>
          PlaceInfoModal(
        index: widget.index,
        title: widget.title,
        description: widget.description,
        openingHours:
            widget.openingHours,
        price: widget.price,
        currentImageIndex:
            _currentImageIndex,
        imageUrls: _imageUrls,
      ),
    ).whenComplete(_startImageTimer);
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(
          'place-info-card-${widget.index}'),
      onVisibilityChanged:
          (visibilityInfo) {
        var visiblePercentage =
            visibilityInfo
                    .visibleFraction *
                100;
        if (mounted) {
          setState(() {
            _isVisible =
                visiblePercentage > 50;
          });
        }
      },
      child: Padding(
        padding: EdgeInsets.only(
          left:
              widget.isFirst ? 0 : 4.0,
          right:
              widget.isLast ? 0 : 4.0,
        ),
        child: SizedBox(
          width: widget.width,
          height: 220,
          child: GestureDetector(
            onTap: _openModal,
            child: Card(
              color: const Color(
                  0xFFF5F5F5),
              shape:
                  RoundedRectangleBorder(
                borderRadius:
                    BorderRadius
                        .circular(15.0),
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment
                        .start,
                children: [
                  _buildImage(),
                  _buildTitleAndRating(),
                  _buildOpeningHours(),
                  _buildPrice(),
                  _buildDescriptionAndButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius:
          const BorderRadius.only(
        topLeft: Radius.circular(15.0),
        topRight: Radius.circular(15.0),
      ),
      child: AnimatedSwitcher(
        duration: Duration(seconds: 1),
        child: Image.network(
          _imageUrls[
              _currentImageIndex],
          key: ValueKey<int>(
              _currentImageIndex),
          fit: BoxFit.cover,
          width: double.infinity,
          height: 120,
        ),
      ),
    );
  }

  Widget _buildTitleAndRating() {
    return Padding(
      padding:
          const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment
                .spaceBetween,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight:
                  FontWeight.bold,
              color: Color(0xFF071013),
            ),
          ),
          if (widget.stars != null)
            Row(
              children: List.generate(5,
                  (index) {
                return Icon(
                  index < widget.stars!
                      ? Icons.star
                      : Icons.star_border,
                  size: 18,
                  color: Colors.amber,
                );
              }),
            ),
        ],
      ),
    );
  }

  Widget _buildOpeningHours() {
    return Padding(
      padding:
          const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 2.0),
      child: Row(
        children: [
          Icon(Icons.access_time,
              size: 16),
          SizedBox(width: 4),
          Text(
            widget.openingHours,
            style: const TextStyle(
                fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildPrice() {
    return Padding(
      padding:
          const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 2.0),
      child: Row(
        children: [
          Icon(Icons.attach_money,
              size: 16),
          SizedBox(width: 4),
          Text(
            widget.price,
            style: const TextStyle(
                fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionAndButton() {
    return Padding(
      padding:
          const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment
                .spaceBetween,
        children: [
          Expanded(
            child: Text(
              widget.description,
              style: const TextStyle(
                  fontSize: 14),
              overflow:
                  TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          IconButton(
            icon: Icon(Icons.add),
            color: Color(0xFF86D5AD),
            onPressed: () {
              print(
                  'clicked button number: ${widget.index}');
            },
          ),
        ],
      ),
    );
  }
}
