import 'package:animated_custom_paints/screens/wave_pattern_3/wave_pattern_3_painter.dart';
import 'package:flutter/material.dart';

class WavePattern3Screen extends StatefulWidget {
  const WavePattern3Screen({super.key});

  @override
  State<WavePattern3Screen> createState() => _WavePattern3ScreenState();
}

class _WavePattern3ScreenState extends State<WavePattern3Screen> {
  double _progress = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Complex Wave Pattern 3"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: CustomPaint(
                size: const Size(300, 300),
                painter: WavePattern3Painter(progress: _progress),
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
