import 'dart:math';
import 'package:flutter/material.dart';

class TreePainter extends CustomPainter {
  final double progress;

  TreePainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height);
    final double initialLength = 100 * progress; // Tree height controlled by progress
    const double angle = pi / 6; // Angle between branches

    drawBranch(canvas, center, -90, initialLength, angle);
  }

  void drawBranch(Canvas canvas, Offset position, double angle, double length, double branchAngle) {
    if (length < 5) return; // Base case for recursion

    final endX = position.dx + length * cos(angle * (pi / 180));
    final endY = position.dy + length * sin(angle * (pi / 180));
    final endPosition = Offset(endX, endY);

    canvas.drawLine(position, endPosition, Paint()..color = Colors.brown..strokeWidth = length / 10);

    // Recursively draw the branches
    drawBranch(canvas, endPosition, angle - branchAngle * (180 / pi), length * 0.7, branchAngle); // Left branch
    drawBranch(canvas, endPosition, angle + branchAngle * (180 / pi), length * 0.7, branchAngle); // Right branch
  }

  @override
  bool shouldRepaint(_) => false;
}