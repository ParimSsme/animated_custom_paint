import 'dart:math';
import 'package:flutter/material.dart';

class WavePattern1Painter extends CustomPainter {
  final double progress;

  WavePattern1Painter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    // Define base wave properties
    int layers = (5 + (progress * 10)).toInt(); // Number of waves increases with progress
    double amplitude = 20 + (progress * 30); // Wave height
    double frequency = 1 + (progress * 2); // Wave frequency

    // Draw multiple waves with different colors and offsets
    for (int i = 0; i < layers; i++) {
      paint.color = Colors.primaries[i % Colors.primaries.length].withOpacity(0.6);

      // Offset each wave slightly
      drawWave(
        canvas,
        size,
        paint,
        amplitude * (1 - i * 0.1), // Slightly decrease amplitude for each layer
        frequency + i * 0.2, // Slightly increase frequency for each layer
        phaseShift: i * pi / 8, // Offset phase for a wave-shifted effect
      );
    }
  }

  void drawWave(Canvas canvas, Size size, Paint paint, double amplitude, double frequency, {double phaseShift = 0}) {
    final Path path = Path();
    for (double x = 0; x <= size.width; x++) {
      double y = size.height / 2 + amplitude * sin((x / size.width * 2 * pi * frequency) + phaseShift);
      if (x == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_) => false;

}