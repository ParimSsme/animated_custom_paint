import 'dart:math';
import 'package:animated_custom_paints/screens/gradient_text/gradient_text_painter.dart';
import 'package:flutter/material.dart';

class GradientTextScreen extends StatefulWidget {
  const GradientTextScreen({super.key});

  @override
  State<GradientTextScreen> createState() => _GradientTextScreenState();
}

class _GradientTextScreenState extends State<GradientTextScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _waveAnimation;
  late Animation<double> _colorAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController and Animations
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3), // Duration for a full cycle
    )..repeat();

    // Wave animation from 0.0 to 2 * pi
    _waveAnimation =
        Tween<double>(begin: 0.0, end: 2 * pi).animate(_controller);

    // Color animation for the gradient
    _colorAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Gradient Text"),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return CustomPaint(
              size: const Size(400, 100), // Size for the text area
              painter: GradientTextPainter(
                waveProgress: _waveAnimation.value,
                colorProgress: _colorAnimation.value,
              ),
            );
          },
        ),
      ),
    );
  }
}
