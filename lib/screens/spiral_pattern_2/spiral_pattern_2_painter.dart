import 'dart:math';
import 'package:flutter/material.dart';

class SpiralPattern2Painter extends CustomPainter {
  final double progress;

  SpiralPattern2Painter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final Paint spiralPaint = Paint()
      ..color = Colors.blueAccent.withOpacity(0.6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    const int numberOfLoops = 20; // Number of spiral loops
    final double maxRadius = size.width / 2 * progress; // Max radius based on progress

    // Draw the spiral
    for (double i = 0; i < numberOfLoops * 2 * pi; i += 0.1) {
      final radius = i / (numberOfLoops * 2 * pi) * maxRadius;
      final angle = i + 2 * pi * progress; // Adding rotation based on progress
      final x = center.dx + radius * cos(angle);
      final y = center.dy + radius * sin(angle);

      if (i > 0) {
        canvas.drawCircle(Offset(x, y), 2.5, spiralPaint);
      }
    }

    // Add a fading tail effect to the spiral
    final tailPaint = Paint()
      ..color = Colors.purple.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    for (double i = 0; i < maxRadius; i += 10) {
      canvas.drawCircle(
          Offset(center.dx, center.dy), i * progress, tailPaint..color = tailPaint.color.withOpacity(1 - i / maxRadius));
    }
  }

  @override
  bool shouldRepaint(_) => false;
}