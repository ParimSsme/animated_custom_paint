import 'package:flutter/material.dart';
import 'face_mood_2_painter.dart';

class FaceMood2Screen extends StatefulWidget {
  const FaceMood2Screen({super.key});

  @override
  State<FaceMood2Screen> createState() => _FaceMood2ScreenState();
}

class _FaceMood2ScreenState extends State<FaceMood2Screen> {
  double _progress = 0.5; // Start with a neutral expression and half-blink

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Face Mood 2"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: CustomPaint(
                size: const Size(200, 200),
                painter: FaceMood2Painter(progress: _progress),
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
              label: (_progress * 10).round().toString(),
            ),
          ),
        ],
      ),
    );
  }
}
