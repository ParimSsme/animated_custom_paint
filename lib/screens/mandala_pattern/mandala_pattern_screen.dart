import 'package:flutter/material.dart';
import 'mandala_painter.dart';

class MandalaPatternScreen extends StatefulWidget {
  const MandalaPatternScreen({super.key});

  @override
  State<MandalaPatternScreen> createState() => _MandalaPatternScreenState();
}

class _MandalaPatternScreenState extends State<MandalaPatternScreen> {

  double _progress = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Complex Mandala Pattern"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: CustomPaint(
                size: const Size(300, 300),
                painter: MandalaPainter(progress: _progress),
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




