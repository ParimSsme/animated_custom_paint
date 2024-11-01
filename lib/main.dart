import 'package:animated_custom_paints/screens/circle_fading_appear/circle_fading_appear_screen.dart';
import 'package:animated_custom_paints/screens/crying_baby/crying_baby_screen.dart';
import 'package:animated_custom_paints/screens/face_mood_1/face_mood_1_screen.dart';
import 'package:animated_custom_paints/screens/face_mood_2/face_mood_2_screen.dart';
import 'package:animated_custom_paints/screens/flower/flower_screen.dart';
import 'package:animated_custom_paints/screens/gradient_text/gradient_text_screen.dart';
import 'package:animated_custom_paints/screens/mandala_pattern/mandala_pattern_screen.dart';
import 'package:animated_custom_paints/screens/moving_snack/moving_snake_screen.dart';
import 'package:animated_custom_paints/screens/spiral_pattern_1/spiral_pattern_1_screen.dart';
import 'package:animated_custom_paints/screens/spiral_pattern_2/spiral_pattern_2_screen.dart';
import 'package:animated_custom_paints/screens/spirograph_pattern/spirograph_pattern_screen.dart';
import 'package:animated_custom_paints/screens/tree/tree_screen.dart';
import 'package:animated_custom_paints/screens/wave_pattern_1/wave_pattern_1_screen.dart';
import 'package:animated_custom_paints/screens/wave_pattern_2/wave_pattern_2_screen.dart';
import 'package:animated_custom_paints/screens/wave_pattern_3/wave_pattern_3_screen.dart';
import 'package:flutter/material.dart';
import 'models/custom_paint_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Custom Paints',
      theme: ThemeData(
          cardTheme: const CardTheme(color: Colors.black45),
          appBarTheme: const AppBarTheme(
              centerTitle: true,
              titleTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 22))),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  final List<CustomPaintModel> list = const [
    CustomPaintModel(name: 'Crying Baby', nextScreen: CryingBabyScreen()),
    CustomPaintModel(name: 'Moving Snake', nextScreen: MovingSnakeScreen()),
    CustomPaintModel(name: 'Gradient Text', nextScreen: GradientTextScreen()),
    CustomPaintModel(name: 'Face Mood 1', nextScreen: FaceMood1Screen()),
    CustomPaintModel(name: 'Face Mood 2', nextScreen: FaceMood2Screen()),
    CustomPaintModel(
        name: 'Mandala Pattern', nextScreen: MandalaPatternScreen()),
    CustomPaintModel(name: 'Tree', nextScreen: TreeScreen()),
    CustomPaintModel(
        name: 'Spiral Pattern 1', nextScreen: SpiralPattern1Screen()),
    CustomPaintModel(
        name: 'Spiral Pattern 2', nextScreen: SpiralPattern2Screen()),
    CustomPaintModel(name: 'Wave Pattern 1', nextScreen: WavePattern1Screen()),
    CustomPaintModel(name: 'Wave Pattern 2', nextScreen: WavePattern2Screen()),
    CustomPaintModel(name: 'Wave Pattern 3', nextScreen: WavePattern3Screen()),
    CustomPaintModel(
        name: 'Spirograph  Pattern', nextScreen: SpirographPatternScreen()),
    CustomPaintModel(name: 'Flower', nextScreen: FlowerScreen()),
    CustomPaintModel(
        name: 'Circle Fading Appear', nextScreen: CircleFadingAppearScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
          child: Column(
            children: [
              const Text(
                'Animated Custom Paints',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (_, index) {
                    return _ListItem(model: list[index]);
                  },
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemCount: list.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  final CustomPaintModel model;
  const _ListItem({
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => model.nextScreen,
        ),
      ),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  model.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
