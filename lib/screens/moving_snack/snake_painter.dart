import 'dart:math';
import 'package:flutter/material.dart';

class SnakePainter extends CustomPainter {
  final double snakeX;
  final double snakeY;
  final double snakeWidth;
  final double snakeLength;

  SnakePainter(
      {required this.snakeX,
        required this.snakeY,
        required this.snakeWidth,
        required this.snakeLength});

  @override
  void paint(Canvas canvas, Size size) {
    Paint snakePaint = Paint()..color = Colors.green;

    // Draw the snake as a series of circles
    for (int i = 0; i < 10; i++) {
      double x = snakeX + i * (snakeWidth * 0.8);
      double y =
          snakeY + sin((x / snakeLength) * 3.14) * 20; // Add some wave effect
      canvas.drawCircle(Offset(x, y), snakeWidth / 2, snakePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}