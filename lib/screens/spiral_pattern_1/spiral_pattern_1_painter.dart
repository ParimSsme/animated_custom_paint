import 'dart:math';
import 'package:flutter/material.dart';

class SpiralPattern1Painter extends CustomPainter {
  final double progress;

  SpiralPattern1Painter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final Paint paint = Paint()
      ..color = Colors.purple.withOpacity(0.8)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    double radius = 5.0; // Initial radius of the spiral
    const double angleIncrement = pi / 30; // Controls curve smoothness

    for (double angle = 0; angle < 2 * pi * progress * 10; angle += angleIncrement) {
      double x = center.dx + radius * cos(angle);
      double y = center.dy + radius * sin(angle);
      radius += 0.5 * progress; // Spiral expands with progress

      canvas.drawCircle(Offset(x, y), 2, paint);
    }
  }

  @override
  bool shouldRepaint(_) => false;
}