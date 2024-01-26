import 'package:flutter/material.dart';

class CirclePinter extends CustomPainter {
  final Color color;

  final double sizeCircle;

  const CirclePinter({
    required this.color,
    required this.sizeCircle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();
    paint.color = color;
    paint.style = PaintingStyle.fill;
    canvas.drawCircle(Offset(size.height, size.height), sizeCircle, paint);
  }

  @override
  bool shouldRepaint(covariant CirclePinter oldDelegate) {
    return sizeCircle != oldDelegate.sizeCircle || color != oldDelegate.color;
  }
}
