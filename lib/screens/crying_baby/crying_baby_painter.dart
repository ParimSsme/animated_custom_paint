import 'package:flutter/material.dart';

class CryingBabyPainter extends CustomPainter {
  final double cryingLevel;
  CryingBabyPainter({
    required this.cryingLevel,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    // Head
    final headPaint = Paint()..color = Colors.pinkAccent.shade100;
    canvas.drawOval(
      Rect.fromCenter(
          center: Offset(centerX, centerY),
          width: size.width * 0.8,
          height: size.height * 0.6),
      headPaint,
    );

    // Eyes
    _drawEye(canvas, Offset(centerX - 30, centerY - 30), cryingLevel);
    _drawEye(canvas, Offset(centerX + 30, centerY - 30), cryingLevel);

    // Mouth
    _drawMouth(canvas, Offset(centerX, centerY + 40), cryingLevel);

    // Tears
    _drawTears(canvas, Offset(centerX - 30, centerY), cryingLevel);
    _drawTears(canvas, Offset(centerX + 30, centerY), cryingLevel);
  }

  void _drawEye(Canvas canvas, Offset position, double cryingLevel) {
    final eyeWhitePaint = Paint()..color = Colors.white;
    final pupilPaint = Paint()..color = Colors.black;

    // Eye white
    canvas.drawOval(
      Rect.fromCenter(center: position, width: 20, height: 30),
      eyeWhitePaint,
    );

    // Pupil
    canvas.drawCircle(position, 5, pupilPaint);

    // Tears below the eye based on crying level
    if (cryingLevel > 0) {
      final tearPaint = Paint()..color = Colors.blueAccent.withOpacity(0.6);
      final tearPath = Path()
        ..moveTo(position.dx, position.dy + 15)
        ..quadraticBezierTo(position.dx - 5, position.dy + 40 * cryingLevel,
            position.dx, position.dy + 55 * cryingLevel)
        ..quadraticBezierTo(position.dx + 5, position.dy + 40 * cryingLevel,
            position.dx, position.dy + 15)
        ..close();
      canvas.drawPath(tearPath, tearPaint);
    }
  }

  void _drawMouth(Canvas canvas, Offset position, double cryingLevel) {
    final mouthPaint = Paint()..color = Colors.redAccent;
    final mouthPath = Path()
      ..moveTo(position.dx - 20, position.dy)
      ..quadraticBezierTo(position.dx, position.dy + 40 * cryingLevel,
          position.dx + 20, position.dy)
      ..close();
    canvas.drawPath(mouthPath, mouthPaint);
  }

  void _drawTears(Canvas canvas, Offset position, double cryingLevel) {
    if (cryingLevel > 0) {
      final tearPaint = Paint()..color = Colors.blueAccent.withOpacity(0.7);
      final tearPath = Path()
        ..moveTo(position.dx, position.dy)
        ..cubicTo(
            position.dx - 10,
            position.dy + 30 * cryingLevel,
            position.dx + 10,
            position.dy + 60 * cryingLevel,
            position.dx,
            position.dy + 80 * cryingLevel)
        ..close();
      canvas.drawPath(tearPath, tearPaint);
    }
  }

  @override
  bool shouldRepaint(_) => false;
}
