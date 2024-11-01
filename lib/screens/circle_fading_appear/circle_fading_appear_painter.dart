import 'dart:math';
import 'package:flutter/material.dart';

class CircleFadingAppearPainter extends CustomPainter {
  final double progress;

  CircleFadingAppearPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    // Draw background
    final paint = Paint()
      ..color = Colors.grey.withOpacity(0.2)
      ..style = PaintingStyle.fill;

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    // Main painting logic
    final double radius = size.width / 2 * progress;
    final Offset center = Offset(size.width / 2, size.height / 2);
    final arcPaint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    // Draw concentric circles based on progress
    for (double i = 0; i < radius; i += 20) {
      canvas.drawCircle(center, i, arcPaint..color = arcPaint.color.withOpacity((radius - i) / radius));
    }

    // Draw a rotating line based on progress
    final angle = 2 * 3.1415 * progress;
    final linePaint = Paint()
      ..color = Colors.deepOrangeAccent
      ..strokeWidth = 4;

    canvas.drawLine(
      center,
      Offset(
        center.dx + radius * 0.9 * cos(angle),
        center.dy + radius * 0.9 * sin(angle),
      ),
      linePaint,
    );
  }

  @override
  bool shouldRepaint(_)  =>  false;
}
