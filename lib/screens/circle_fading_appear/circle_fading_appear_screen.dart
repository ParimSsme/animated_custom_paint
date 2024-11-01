import 'package:animated_custom_paints/screens/circle_fading_appear/circle_fading_appear_painter.dart';
import 'package:flutter/material.dart';

class CircleFadingAppearScreen extends StatefulWidget {
  const CircleFadingAppearScreen({super.key});

  @override
  State<CircleFadingAppearScreen> createState() =>
      _CircleFadingAppearScreenState();
}

class _CircleFadingAppearScreenState extends State<CircleFadingAppearScreen> {
  double _progress = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Circle Fading Appear'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: CustomPaint(
                size: const Size(300, 300),
                painter: CircleFadingAppearPainter(progress: _progress),
              ),
            ),
          ),
          // A Slider to control the progress
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
            ),
          ),
        ],
      ),
    );
  }
}
