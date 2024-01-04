import 'package:flutter/material.dart';

class CustomCardBalance extends StatelessWidget {
  const CustomCardBalance({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 170,
          width: 360,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFFE42C66),
                Color(0xFFF55B46),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: CustomPaint(
            painter: EllipsePainter(color: Colors.black.withOpacity(0.1)),
          ),
        ),
        const Positioned(
          top: 30,
          left: 20,
          child: SizedBox(
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Current Balance',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '\$ 2,500.00',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class EllipsePainter extends CustomPainter {
  const EllipsePainter({required this.color});
  final Color color;
  @override
  void paint(Canvas canvas, Size size) {
    final brush = Paint()..color = color;
    final path = Path()

      // Primer arco
      ..moveTo(0, size.height * 0.5)
      ..quadraticBezierTo(
        size.width * 0.3,
        size.height * 0.5,
        size.width * 0.5,
        size.height,
      )
      ..lineTo(size.width * 0.05, size.height)
      ..quadraticBezierTo(
        0,
        size.height,
        0,
        size.height * 0.85,
      )

      // Segundo arco
      ..moveTo(size.width * 0.5, 0)
      ..quadraticBezierTo(
        size.width * 0.7,
        size.height * 0.5,
        size.width,
        size.height * 0.5,
      )
      ..lineTo(size.width, size.height * 0.1)
      ..quadraticBezierTo(
        size.width,
        0,
        size.width * 0.90,
        0,
      )
      ..close();
    canvas.drawPath(path, brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
