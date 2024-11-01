import 'package:flutter/material.dart';
import 'flower_painter.dart';

class FlowerScreen extends StatefulWidget {
  const FlowerScreen({super.key});

  @override
  State<FlowerScreen> createState() => _FlowerScreenState();
}

class _FlowerScreenState extends State<FlowerScreen> {
  double _progress = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flower"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // CustomPaint with FlowerPainter
          Expanded(
            child: Center(
              child: CustomPaint(
                size: const Size(300, 300),
                painter: FlowerPainter(progress: _progress),
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
