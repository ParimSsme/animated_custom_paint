import 'package:flutter/material.dart';
import 'face_mood_1_painter.dart';

class FaceMood1Screen extends StatefulWidget {
  const FaceMood1Screen({super.key});

  @override
  State<FaceMood1Screen> createState() => _FaceMood1ScreenState();
}

class _FaceMood1ScreenState extends State<FaceMood1Screen> {
  double _progress = 0.5; // Start with a neutral expression

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Face Mood 1"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: CustomPaint(
                size: const Size(200, 200),
                painter: FaceMood1Painter(progress: _progress),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Slider(
              value: _progress,
              onChanged: (newProgress) {
                setState(() {
                  _progress = newProgress;
                });
              },
              min: 0.0,
              max: 1.0,
              divisions: 10,
              label: (_progress * 10).round().toString(),
            ),
          ),
        ],
      ),
    );
  }
}
