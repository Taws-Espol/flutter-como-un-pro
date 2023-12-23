import 'dart:math';

import 'package:flutter/material.dart';

class PlaygroundPage2 extends StatefulWidget {
  const PlaygroundPage2({super.key});

  @override
  State<PlaygroundPage2> createState() => _PlaygroundPage2State();
}

class _PlaygroundPage2State extends State<PlaygroundPage2>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> angle;
  late Animation<double> scale;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    );

    angle = Tween(begin: 0.0, end: 2 * pi).animate(controller);
    // angle = Tween(begin: 0.0, end: 2 * pi).animate(
    //   CurvedAnimation(parent: controller, curve: Curves.easeInCubic),
    // );
    scale = Tween(begin: 0.0, end: 10.0).animate(controller);

    // controller.forward(); play
    // controller.stop(); pause
    // controller.repeat();
    // controller.reset();
    // controller.reverse();

    controller.addListener(() {
      print(angle.value);
    });

    // controller.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse();
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    //   print(status);
    // });

    // controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          child: Container(
            width: 200,
            height: 200,
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(60),
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60),
              ),
            ),
          ),
          builder: (context, child) {
            return Transform.scale(
              scale: scale.value,
              child: Transform.rotate(
                angle: angle.value,
                child: child!,
              ),
            );
          },
        ),
      ),
      floatingActionButton: Acciones(controller: controller),
    );
  }
}

class Acciones extends StatelessWidget {
  const Acciones({super.key, required this.controller});
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    SizedBox rowDivider = const SizedBox(
      width: 16,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () => {controller.forward()},
          child: const Icon(Icons.play_arrow),
        ),
        rowDivider,
        FloatingActionButton(
          onPressed: () => {controller.stop()},
          child: const Icon(Icons.pause),
        ),
        rowDivider,
        FloatingActionButton(
          onPressed: () => {controller.reset()},
          child: const Icon(Icons.rotate_left),
        ),
      ],
    );
  }
}
