import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_como_un_pro/app/widgets/GraficoArco.dart';

class PlaygroundPage extends StatefulWidget {
  const PlaygroundPage({super.key});

  @override
  State<PlaygroundPage> createState() => _PlaygroundPageState();
}

class _PlaygroundPageState extends State<PlaygroundPage> {
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
