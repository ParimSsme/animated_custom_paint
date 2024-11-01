import 'dart:math';
import 'package:flutter/material.dart';

class WavePattern2Painter extends CustomPainter {
  final double progress;

  WavePattern2Painter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final Paint wavePaint = Paint()
      ..color = Colors.blueAccent.withOpacity(0.7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    const int waveCount = 12; // Number of wave rings
    final double maxRadius = size.width / 2 * progress; // Expands with progress
    final double amplitude = 20 * progress; // Amplitude controlled by progress
    final double frequency = 4 + 4 * progress; // Frequency varies with progress

    for (int i = 1; i <= waveCount; i++) {
      final double radius = (i / waveCount) * maxRadius;

      Path wavePath = Path();
      for (double angle = 0; angle <= 2 * pi; angle += 0.05) {
        // Calculate x and y for each point on the wave
        final double waveX = center.dx + radius * cos(angle);
        final double waveY = center.dy + radius * sin(angle) +
            amplitude * sin(frequency * angle + i * progress * pi);

        if (angle == 0) {
          wavePath.moveTo(waveX, waveY);
        } else {
          wavePath.lineTo(waveX, waveY);
        }
      }
      wavePath.close();
      canvas.drawPath(wavePath, wavePaint..color = wavePaint.color.withOpacity(1 - i / waveCount));
    }
  }

  @override
  bool shouldRepaint(_) => false;

}