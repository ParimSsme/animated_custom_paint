import 'dart:math';
import 'package:flutter/material.dart';

class FlowerPainter extends CustomPainter {
  final double progress;

  FlowerPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final double maxRadius = size.width / 3 * progress;
    const int numberOfPetals = 12; // Number of petals
    final petalPaint = Paint()
      ..color = Colors.deepOrangeAccent
      ..style = PaintingStyle.fill;

    for (int i = 0; i < numberOfPetals; i++) {
      // Angle for each petal
      final angle = 2 * pi * i / numberOfPetals + 2 * pi * progress;

      // Calculate petal position and rotation
      final double petalX = center.dx + maxRadius * cos(angle);
      final double petalY = center.dy + maxRadius * sin(angle);

      // Petal shape controlled by progress
      final petalRadiusX = 20 + 50 * progress; // Width of the petal
      final petalRadiusY = 10 + 40 * progress; // Height of the petal

      // Draw each petal as an oval shape
      canvas.save();
      canvas.translate(petalX, petalY);
      canvas.rotate(angle);
      canvas.drawOval(
        Rect.fromCenter(
          center: Offset(0, 0),
          width: petalRadiusX,
          height: petalRadiusY,
        ),
        petalPaint,
      );
      canvas.restore();
    }

    // Draw the center of the flower
    final centerPaint = Paint()..color = Colors.yellow;
    canvas.drawCircle(center, maxRadius * 0.1, centerPaint);
  }

  @override
  bool shouldRepaint(_) => false;
}