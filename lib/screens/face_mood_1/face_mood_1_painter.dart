import 'package:flutter/material.dart';
import 'dart:math';

class FaceMood1Painter extends CustomPainter {
  final double progress;

  FaceMood1Painter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final double faceRadius = size.width / 2.2;
    final Paint facePaint = Paint()..color = Colors.yellow;
    final Paint eyePaint = Paint()..color = Colors.black;
    final Paint mouthPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    final Paint eyebrowPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    // Draw the face circle
    canvas.drawCircle(center, faceRadius, facePaint);

    // Draw the eyes
    final double eyeRadius = faceRadius / 10;
    final double eyeOffsetX = faceRadius / 2.5;
    final double eyeOffsetY = faceRadius / 3;

    // Eye shape based on progress
    double eyeHeight = eyeRadius * (1 - progress * 0.5);
    double eyeWidth = eyeRadius + (progress * 5);

    // Left eye
    Rect leftEyeRect = Rect.fromCenter(
      center: Offset(center.dx - eyeOffsetX, center.dy - eyeOffsetY),
      width: eyeWidth,
      height: eyeHeight,
    );
    canvas.drawOval(leftEyeRect, eyePaint);

    // Right eye
    Rect rightEyeRect = Rect.fromCenter(
      center: Offset(center.dx + eyeOffsetX, center.dy - eyeOffsetY),
      width: eyeWidth,
      height: eyeHeight,
    );
    canvas.drawOval(rightEyeRect, eyePaint);

    // Draw eyebrows
    double eyebrowAngle = (progress - 0.5) * pi / 6; // Angle of eyebrow
    double eyebrowLength = faceRadius / 2;
    canvas.drawLine(
      Offset(center.dx - eyeOffsetX - cos(eyebrowAngle) * eyebrowLength / 2, center.dy - eyeOffsetY - sin(eyebrowAngle) * eyebrowLength / 2 - 15),
      Offset(center.dx - eyeOffsetX + cos(eyebrowAngle) * eyebrowLength / 2, center.dy - eyeOffsetY + sin(eyebrowAngle) * eyebrowLength / 2 - 15),
      eyebrowPaint,
    );
    canvas.drawLine(
      Offset(center.dx + eyeOffsetX - cos(-eyebrowAngle) * eyebrowLength / 2, center.dy - eyeOffsetY - sin(-eyebrowAngle) * eyebrowLength / 2 - 15),
      Offset(center.dx + eyeOffsetX + cos(-eyebrowAngle) * eyebrowLength / 2, center.dy - eyeOffsetY + sin(-eyebrowAngle) * eyebrowLength / 2 - 15),
      eyebrowPaint,
    );

    // Draw the mouth
    final double mouthWidth = faceRadius / 1.2;
    final double smileFactor = (progress - 0.5) * 2; // Range from -1 (sad) to +1 (happy)

    final Path mouthPath = Path();
    mouthPath.moveTo(center.dx - mouthWidth / 2, center.dy + faceRadius / 3);
    mouthPath.quadraticBezierTo(
      center.dx,
      center.dy + faceRadius / 3 + smileFactor * 20, // Control point for smile curve
      center.dx + mouthWidth / 2,
      center.dy + faceRadius / 3,
    );

    canvas.drawPath(mouthPath, mouthPaint);
  }

  @override
  bool shouldRepaint(_) => false;
}