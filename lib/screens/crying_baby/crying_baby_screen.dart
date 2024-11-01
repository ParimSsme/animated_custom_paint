import 'package:flutter/material.dart';
import 'crying_baby_painter.dart';

class CryingBabyScreen extends StatefulWidget {
  const CryingBabyScreen({super.key});

  @override
  State<CryingBabyScreen> createState() => _CryingBabyScreenState();
}

class _CryingBabyScreenState extends State<CryingBabyScreen>
    with SingleTickerProviderStateMixin {
  double cryingLevel = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crying Baby Animation"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: CustomPaint(
                painter: CryingBabyPainter(cryingLevel: cryingLevel),
                child: const SizedBox(
                  width: 200,
                  height: 300,
                ),
              ),
            ),
          ),
          Slider(
            value: cryingLevel,
            onChanged: (value) {
              setState(() {
                cryingLevel = value;
              });
            },
            min: 0.0,
            max: 1.0,
          ),
        ],
      ),
    );
  }
}
