import 'package:animated_custom_paints/screens/moving_snack/snake_painter.dart';
import 'package:flutter/material.dart';

class MovingSnakeScreen extends StatefulWidget {
  const MovingSnakeScreen({super.key});

  @override
  State<MovingSnakeScreen> createState() => _MovingSnakeScreenState();
}

class _MovingSnakeScreenState extends State<MovingSnakeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final double snakeWidth = 20.0; // Width of the snake
  double snakeX = 0.0; // Initial X position of the snake
  double snakeY = 200.0; // Y position of the snake
  double snakeLength = 150.0; // Length of the snake
  bool movingRight = true; // Direction of the snake movement

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController and Animation
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    // Animation to move the snake across the screen
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ))
      ..addListener(() {
        setState(() {
          // Update the snake's position based on animation progress
          snakeX = _animation.value *
              (MediaQuery.of(context).size.width + snakeLength);
          // Reverse direction when reaching the edge
          if (snakeX > MediaQuery.of(context).size.width) {
            movingRight = false;
          } else if (snakeX < -snakeLength) {
            movingRight = true;
          }
          snakeX = movingRight
              ? snakeX
              : (MediaQuery.of(context).size.width - (snakeX + snakeLength));
        });
      });
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
        title: const Text("Moving Snake Animation"),
      ),
      body: Center(
        child: CustomPaint(
          size: Size(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height),
          painter: SnakePainter(
            snakeX: snakeX,
            snakeY: snakeY,
            snakeWidth: snakeWidth,
            snakeLength: snakeLength,
          ),
        ),
      ),
    );
  }
}
