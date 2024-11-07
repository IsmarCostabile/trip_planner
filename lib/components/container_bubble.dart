import 'package:flutter/material.dart';

class ContainerBubble
    extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;

  const ContainerBubble({
    super.key,
    required this.child,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.all(8.0),
      child: Container(
        width: width,
        height: height,
        padding:
            const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color:
              const Color(0xFFF5F5F5),
          borderRadius:
              BorderRadius.circular(
                  12.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8.0,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
