import 'package:animated_custom_paints/screens/wave_pattern_2/wave_pattern_2_painter.dart';
import 'package:flutter/material.dart';

class WavePattern2Screen extends StatefulWidget {
  const WavePattern2Screen({super.key});

  @override
  State<WavePattern2Screen> createState() => _WavePattern2ScreenState();
}

class _WavePattern2ScreenState extends State<WavePattern2Screen> {
  double _progress = 0.3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Complex Wave Pattern 2"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: CustomPaint(
                size: const Size(300, 300),
                painter: WavePattern2Painter(progress: _progress),
              ),
            ),
          ),
          // Progress bar for controlling wave properties
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
