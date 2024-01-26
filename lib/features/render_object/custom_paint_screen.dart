import 'package:flutter/material.dart';

import 'circle_painter.dart';

class RenderObjectScreen extends StatefulWidget {
  const RenderObjectScreen({super.key});

  @override
  State<RenderObjectScreen> createState() => _RenderObjectScreenState();
}

class _RenderObjectScreenState extends State<RenderObjectScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> sizeAnimation;
  late Animation<Color?> colorAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2,
      ),
    )..repeat(reverse: true);
    sizeAnimation = Tween<double>(begin: 25, end: 50).animate(
      controller,
    );

    colorAnimation =
        ColorTween(begin: Colors.red, end: Colors.blue).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Render Object Example'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) => CustomPaint(
            painter: CirclePinter(
                sizeCircle: sizeAnimation.value,
                color: colorAnimation.value ?? Colors.red),
            // size: const Size.square(120),
          ),
        ),
      ),
    );
  }
}
