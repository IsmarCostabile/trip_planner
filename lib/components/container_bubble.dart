import 'package:flutter/material.dart';

class ContainerBubble
    extends StatelessWidget {
  final Widget child;

  const ContainerBubble({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.all(8.0),
      child: Container(
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
