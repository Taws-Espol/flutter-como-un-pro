import 'dart:math';

import 'package:flutter/material.dart';

class GraficoArco extends StatelessWidget {
  const GraficoArco({
    super.key,
    required this.porcentaje,
  });
  final int porcentaje;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: GraficoArcoPainter(porcentaje: porcentaje),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          "$porcentaje%",
          style: const TextStyle(
            fontSize: 60,
          ),
        ),
      ),
    );
  }
}

class GraficoArcoPainter extends CustomPainter {
  final int porcentaje;

  GraficoArcoPainter({super.repaint, required this.porcentaje});
  @override
  void paint(Canvas canvas, Size size) {
    //Lapiz
    final lapizGris = Paint()
      ..color = Colors.grey //Parametro
      ..strokeWidth = 3 //Parametro
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    //Movimiento-trazo
    //Canvas
    final centro = Offset(size.width * 0.50, size.height);
    final radio = min(size.width * 0.50, size.height);
    final ubicacion = Rect.fromCircle(center: centro, radius: radio);
    canvas.drawArc(ubicacion, pi, pi, false, lapizGris); //TODO: useCenter

    //Relleno

    final lapizRelleno = Paint()
      ..color = Colors.blue //Parametro
      ..strokeWidth = 10 //Parametro
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(ubicacion, pi, pi * (porcentaje / 100), false, lapizRelleno);

    IconData iconData = Icons.star_rounded;
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: String.fromCharCode(iconData.codePoint),
        style: TextStyle(
          fontSize: 30,
          color: Colors.yellow,
          fontFamily: iconData.fontFamily,
        ),
      ),
      textDirection: TextDirection.rtl,
    );

    textPainter.layout(); // ...
    textPainter.paint(
      canvas,
      Offset(
        size.width - (textPainter.width / 2),
        size.height - (textPainter.width / 2),
      ),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
