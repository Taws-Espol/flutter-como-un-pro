import 'dart:math';

import 'package:flutter/material.dart';

class PlaygroundScreen extends StatefulWidget {
  const PlaygroundScreen({super.key});

  @override
  State<PlaygroundScreen> createState() => _PlaygroundScreenState();
}

class _PlaygroundScreenState extends State<PlaygroundScreen> {
  Color randomColor = Colors.blue;
  double randomWidth = 300;
  double randomHeight = 100;

  void changeColor() {
    Random random = Random();
    setState(() {
      randomColor = Color.fromARGB(
        255,
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
      );

      randomWidth = (random.nextDouble() * 400) + 1;
      randomHeight = (random.nextDouble() * 800) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: changeColor,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            width: randomWidth,
            height: randomHeight,
            color: randomColor,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeColor,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
