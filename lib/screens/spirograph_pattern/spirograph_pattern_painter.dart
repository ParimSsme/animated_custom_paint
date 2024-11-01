import 'dart:math';
import 'package:flutter/material.dart';

class SpirographPatternPainter extends CustomPainter {
  final double progress;

  SpirographPatternPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final Paint paint = Paint()
      ..color = Colors.blueAccent.withOpacity(0.6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    // Spirograph Parameters
    final int circles = (6 + progress * 18).toInt(); // Controls circle count
    final double maxRadius = size.width / 2 * progress;
    const double angleStep = pi / 180; // Step size for drawing smooth curves
    final double loopMultiplier = 6 * progress; // Controls pattern complexity

    for (int i = 0; i < circles; i++) {
      Path path = Path();
      final double radius = maxRadius * (i + 1) / circles;
      final double angleOffset = (2 * pi / circles) * i;

      for (double angle = 0; angle <= 2 * pi * loopMultiplier; angle += angleStep) {
        final double x = center.dx + radius * cos(angle + angleOffset) * cos(loopMultiplier * angle);
        final double y = center.dy + radius * sin(angle + angleOffset) * cos(loopMultiplier * angle);

        if (angle == 0) {
          path.moveTo(x, y);
        } else {
          path.lineTo(x, y);
        }
      }
      canvas.drawPath(path, paint..color = paint.color.withOpacity(0.5 + 0.5 * i / circles));
    }
  }

  @override
  bool shouldRepaint(_) => false;

}