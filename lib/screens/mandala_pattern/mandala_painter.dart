import 'dart:math';
import 'package:flutter/material.dart';

class MandalaPainter extends CustomPainter {
  final double progress;

  MandalaPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    // Number of layers and shapes
    final int layers = (5 + (progress * 10)).toInt();
    final double maxRadius = (size.width / 2) * progress;

    for (int i = 0; i < layers; i++) {
      double radius = (maxRadius / layers) * (i + 1);
      drawLayer(canvas, center, radius, i);
    }
  }

  void drawLayer(Canvas canvas, Offset center, double radius, int layerIndex) {
    final Paint paint = Paint()
      ..color = Colors.blue[(layerIndex % 9 + 1) * 100]!
      ..style = PaintingStyle.fill;

    final int shapesCount = 12 + (layerIndex * 2); // Number of shapes in each layer
    final double angleStep = (2 * pi) / shapesCount;

    for (int j = 0; j < shapesCount; j++) {
      final double angle = angleStep * j;
      final double x = center.dx + radius * cos(angle);
      final double y = center.dy + radius * sin(angle);

      // Draw shapes with a slight offset
      final double shapeSize = 10 + (10 * layerIndex * progress);
      canvas.drawCircle(Offset(x, y), shapeSize, paint);
    }
  }

  @override
  bool shouldRepaint(_) => false;
}