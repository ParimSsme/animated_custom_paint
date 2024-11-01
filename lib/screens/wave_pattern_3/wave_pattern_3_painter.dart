import 'dart:math';
import 'package:flutter/material.dart';

class WavePattern3Painter extends CustomPainter {
  final double progress;

  WavePattern3Painter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final Paint wavePaint = Paint()
      ..color = Colors.blueAccent.withOpacity(0.6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    const int waveCount = 10; // Number of waves
    final double maxRadius = size.width / 2; // Maximum radius of the waves
    final double amplitude = 20 * progress; // Wave height controlled by progress
    final double frequency = 5 * progress; // Wave frequency controlled by progress

    for (int i = 1; i <= waveCount; i++) {
      final double radius = (i / waveCount) * maxRadius;

      Path wavePath = Path();
      for (double angle = 0; angle <= 2 * pi; angle += 0.05) {
        final double waveX = center.dx + radius * cos(angle);
        final double waveY = center.dy + radius * sin(angle) +
            amplitude * sin(angle * frequency + i * progress * pi);

        if (angle == 0) {
          wavePath.moveTo(waveX, waveY);
        } else {
          wavePath.lineTo(waveX, waveY);
        }
      }
      wavePath.close();
      canvas.drawPath(wavePath, wavePaint);
    }
  }

  @override
  bool shouldRepaint(_) => false;

}