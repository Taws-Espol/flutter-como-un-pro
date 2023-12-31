import 'package:flutter/material.dart';
import 'package:flutter_como_un_pro/core/theme/custom_color.dart';

class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({super.key});

  @override
  Widget build(BuildContext context) {
    final customColor = Theme.of(context).extension<CustomColor>()!;
    final size = MediaQuery.of(context).size;

    return Container(
      color: customColor.backgroundPrimaryColor,
      width: double.infinity,
      height: size.height * 0.40,
    );
  }
}

class HeaderRedondeado extends StatelessWidget {
  const HeaderRedondeado({super.key});

  @override
  Widget build(BuildContext context) {
    final customColor = Theme.of(context).extension<CustomColor>()!;
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.40,
      decoration: BoxDecoration(
        color: customColor.backgroundPrimaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({super.key});

  @override
  Widget build(BuildContext context) {
    final customColor = Theme.of(context).extension<CustomColor>()!;
    final size = MediaQuery.of(context).size;

    return Container(
      // color: customColor.backgroundPrimaryColor,
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(
          color: customColor.backgroundPrimaryColor,
        ),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  final Color color;

  _HeaderDiagonalPainter({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    lapiz.color = color;
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 20;

    final path = Path();
    path.lineTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class HeaderRombo extends StatelessWidget {
  const HeaderRombo({super.key});

  @override
  Widget build(BuildContext context) {
    final customColor = Theme.of(context).extension<CustomColor>()!;
    final size = MediaQuery.of(context).size;

    return Container(
      // color: customColor.backgroundPrimaryColor,
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _HeaderRomboPainter(
          color: customColor.backgroundPrimaryColor,
        ),
      ),
    );
  }
}

class _HeaderRomboPainter extends CustomPainter {
  final Color color;

  _HeaderRomboPainter({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    lapiz.color = color;
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 10;

    final path = Path();
    path.lineTo(0, size.height * 0.25);
    path.lineTo(size.width * 0.5, size.height * 0.30);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    // path.lineTo(0, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class HeaderRedondo extends StatelessWidget {
  const HeaderRedondo({super.key});

  @override
  Widget build(BuildContext context) {
    final customColor = Theme.of(context).extension<CustomColor>()!;
    final size = MediaQuery.of(context).size;

    return Container(
      // color: customColor.backgroundPrimaryColor,
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _HeaderRedondoPainter(
          color: customColor.backgroundPrimaryColor,
        ),
      ),
    );
  }
}

class _HeaderRedondoPainter extends CustomPainter {
  final Color color;

  _HeaderRedondoPainter({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    lapiz.color = color;
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 10;

    final path = Path();
    path.lineTo(0, size.height * 0.30);
    path.quadraticBezierTo(
        size.width * 0.50, size.height * 0.45, size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class HeaderOla extends StatelessWidget {
  const HeaderOla({super.key});

  @override
  Widget build(BuildContext context) {
    final customColor = Theme.of(context).extension<CustomColor>()!;
    final size = MediaQuery.of(context).size;

    return Container(
      // color: customColor.backgroundPrimaryColor,
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _HeaderOlaPainter(
          color: customColor.backgroundPrimaryColor,
        ),
      ),
    );
  }
}

class _HeaderOlaPainter extends CustomPainter {
  final Color color;

  _HeaderOlaPainter({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect =
        Rect.fromCircle(center: Offset(0, size.height * 0.25), radius: 200);

    const Gradient gradiente = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.lightBlueAccent,
        Colors.blue,
      ],
    );

    final lapiz = Paint();
    lapiz.shader = gradiente.createShader(rect);
    lapiz.color = color;
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 5;

    final path = Path();
    path.lineTo(0, size.height * 0.50);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.45,
      size.width * 0.5,
      size.height * 0.50,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.55,
      size.width,
      size.height * 0.50,
    );
    path.lineTo(size.width, 0);
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
