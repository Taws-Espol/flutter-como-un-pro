import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_como_un_pro/app/widgets/GraficoArco.dart';
import 'package:flutter_como_un_pro/app/widgets/GraficoCirculo.dart';

class PlaygroundPage extends StatelessWidget {
  const PlaygroundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 200,
          // color: Colors.redAccent,
          child: GraficoArco(porcentaje: 100),
        ),
      ),
    );
  }
}
