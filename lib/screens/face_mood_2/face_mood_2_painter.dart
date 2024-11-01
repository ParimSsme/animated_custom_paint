import 'package:flutter/material.dart';

class FaceMood2Painter extends CustomPainter {
  final double progress;

  FaceMood2Painter({required this.progress});

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
    final Paint eyelidPaint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;

    // Draw the face circle
    canvas.drawCircle(center, faceRadius, facePaint);

    // Draw eyes
    final double eyeOffsetX = faceRadius / 2.5;
    final double eyeOffsetY = faceRadius / 3;
    final double eyeWidth = faceRadius / 5;
    final double eyeHeight = eyeWidth * (1 - progress); // Vary eye height with progress

    // Left Eye
    final Rect leftEyeRect = Rect.fromCenter(
      center: Offset(center.dx - eyeOffsetX, center.dy - eyeOffsetY),
      width: eyeWidth,
      height: eyeHeight,
    );
    canvas.drawOval(leftEyeRect, eyePaint);

    // Right Eye
    final Rect rightEyeRect = Rect.fromCenter(
      center: Offset(center.dx + eyeOffsetX, center.dy - eyeOffsetY),
      width: eyeWidth,
      height: eyeHeight,
    );
    canvas.drawOval(rightEyeRect, eyePaint);

    // Draw top and bottom eyelids (for blinking effect)
    final Path leftTopEyelidPath = Path();
    leftTopEyelidPath.moveTo(center.dx - eyeOffsetX - eyeWidth / 2, center.dy - eyeOffsetY);
    leftTopEyelidPath.quadraticBezierTo(
      center.dx - eyeOffsetX,
      center.dy - eyeOffsetY - (eyeHeight / 2) * progress,
      center.dx - eyeOffsetX + eyeWidth / 2,
      center.dy - eyeOffsetY,
    );
    canvas.drawPath(leftTopEyelidPath, eyelidPaint);

    final Path rightTopEyelidPath = Path();
    rightTopEyelidPath.moveTo(center.dx + eyeOffsetX - eyeWidth / 2, center.dy - eyeOffsetY);
    rightTopEyelidPath.quadraticBezierTo(
      center.dx + eyeOffsetX,
      center.dy - eyeOffsetY - (eyeHeight / 2) * progress,
      center.dx + eyeOffsetX + eyeWidth / 2,
      center.dy - eyeOffsetY,
    );
    canvas.drawPath(rightTopEyelidPath, eyelidPaint);

    // Draw the mouth
    final double mouthWidth = faceRadius / 1.5;
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
