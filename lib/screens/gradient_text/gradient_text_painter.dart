import 'dart:math';
import 'package:flutter/material.dart';

class GradientTextPainter extends CustomPainter {
  final double waveProgress;
  final double colorProgress;

  GradientTextPainter({required this.waveProgress, required this.colorProgress});

  @override
  void paint(Canvas canvas, Size size) {
    // Define the gradient based on the animation progress
    final Color startColor = Color.lerp(Colors.red, Colors.amber, colorProgress)!;
    final Color endColor = Color.lerp(Colors.black, Colors.green, colorProgress)!;

    final Shader shader = LinearGradient(
      colors: [startColor, endColor],
      tileMode: TileMode.clamp,
    ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final TextStyle textStyle = TextStyle(
      fontSize: 50, // Font size
      fontWeight: FontWeight.bold,
      foreground: Paint()..shader = shader, // Apply gradient
    );

    final TextSpan textSpan = TextSpan(
      text: "Afghanistan", // Text to display
      style: textStyle,
    );

    final TextPainter textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(); // Layout the text

    // Calculate the vertical wave effect
    double waveHeight = 15.0; // Amplitude of the wave
    double yOffset = waveHeight * sin(waveProgress * 2); // Calculate the vertical offset

    // Draw the text with the calculated offset
    canvas.save();
    canvas.translate((size.width - textPainter.width) / 2, (size.height - textPainter.height) / 2 + yOffset);
    textPainter.paint(canvas, const Offset(0, 0));
    canvas.restore();
  }

  @override
  bool shouldRepaint(_) => true;
}