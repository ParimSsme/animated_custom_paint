import 'package:animated_custom_paints/screens/spirograph_pattern/spirograph_pattern_painter.dart';
import 'package:flutter/material.dart';

class SpirographPatternScreen extends StatefulWidget {
  const SpirographPatternScreen({super.key});

  @override
  State<SpirographPatternScreen> createState() =>
      _SpirographPatternScreenState();
}

class _SpirographPatternScreenState extends State<SpirographPatternScreen> {
  double _progress = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Spirograph Pattern 2"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: CustomPaint(
                size: const Size(300, 300),
                painter: SpirographPatternPainter(progress: _progress),
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
