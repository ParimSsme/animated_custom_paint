import 'package:animated_custom_paints/screens/spiral_pattern_1/spiral_pattern_1_painter.dart';
import 'package:flutter/material.dart';

class SpiralPattern1Screen extends StatefulWidget {
  const SpiralPattern1Screen({super.key});

  @override
  State<SpiralPattern1Screen> createState() => _SpiralPattern1ScreenState();
}

class _SpiralPattern1ScreenState extends State<SpiralPattern1Screen> {
  double _progress = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Complex Spiral Pattern 1"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: CustomPaint(
                size: const Size(300, 300),
                painter: SpiralPattern1Painter(progress: _progress),
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
            ),
          ),
        ],
      ),
    );
  }
}
