import 'package:animated_custom_paints/screens/spiral_pattern_2/spiral_pattern_2_painter.dart';
import 'package:flutter/material.dart';

class SpiralPattern2Screen extends StatefulWidget {
  const SpiralPattern2Screen({super.key});

  @override
  State<SpiralPattern2Screen> createState() => _SpiralPattern2ScreenState();
}

class _SpiralPattern2ScreenState extends State<SpiralPattern2Screen> {
  double _progress = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Complex Spiral Pattern"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: CustomPaint(
                size: const Size(300, 300),
                painter: SpiralPattern2Painter(progress: _progress),
              ),
            ),
          ),
          // Progress bar to control the progress
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
