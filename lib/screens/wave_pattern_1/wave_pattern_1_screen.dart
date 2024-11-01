import 'package:animated_custom_paints/screens/wave_pattern_1/wave_pattern_1_painter.dart';
import 'package:flutter/material.dart';

class WavePattern1Screen extends StatefulWidget {
  const WavePattern1Screen({super.key});

  @override
  State<WavePattern1Screen> createState() => _WavePattern1ScreenState();
}

class _WavePattern1ScreenState extends State<WavePattern1Screen> {
  double _progress = 0.4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Complex Wave Pattern 1"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: CustomPaint(
                size: const Size(double.infinity, 300),
                painter: WavePattern1Painter(progress: _progress),
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
