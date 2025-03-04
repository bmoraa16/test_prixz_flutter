import 'package:flutter/material.dart';

class NotificationDotWidget extends StatelessWidget {
  const NotificationDotWidget({
    super.key,
    this.top = 0,
    this.right = 0,
    this.bottom,
    this.left,
    this.size = 12,
  });

  final double? top, right, bottom, left;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Container(
        height: size,
        width: size,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red,
        ),
      ),
    );
  }
}
