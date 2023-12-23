import 'dart:math';

import 'package:flutter/material.dart';

class GraficoCirculo extends StatelessWidget {
  const GraficoCirculo({
    super.key,
    required this.porcentaje,
  });
  final int porcentaje;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: GraficoCirculoPainter(porcentaje: porcentaje),
      child: Align(
        alignment: Alignment.center,
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

class GraficoCirculoPainter extends CustomPainter {
  final int porcentaje;

  GraficoCirculoPainter({super.repaint, required this.porcentaje});
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
    final centro = Offset(size.width * 0.50, size.height * 0.50);
    final radio = min(size.width * 0.50, size.height * 0.50);
    final ubicacion = Rect.fromCircle(center: centro, radius: radio);
    canvas.drawArc(ubicacion, pi, 2 * pi, false, lapizGris); //TODO: useCenter

    //Relleno

    final lapizRelleno = Paint()
      ..color = Colors.blue //Parametro
      ..strokeWidth = 10 //Parametro
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      ubicacion,
      pi,
      2 * pi * (porcentaje / 100),
      false,
      lapizRelleno,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
