import 'package:flutter/material.dart';

const colorLight = CustomColor(
  backgroundPrimaryColor: Color(0xffffffff),
);

const colorDark = CustomColor(
  backgroundPrimaryColor: Color(0xff000000),
);

class CustomColor extends ThemeExtension<CustomColor> {
  const CustomColor({
    required this.backgroundPrimaryColor,
  });

  final Color backgroundPrimaryColor;

  // https://palx.jxnblk.com/
  //Ejemplo: Generar paleta con este color 3897F0

  @override
  CustomColor copyWith({
    Color? backgroundPrimaryColor,
  }) {
    return CustomColor(
      backgroundPrimaryColor:
          backgroundPrimaryColor ?? this.backgroundPrimaryColor,
    );
  }

  @override
  CustomColor lerp(ThemeExtension<CustomColor>? other, double t) {
    if (other is! CustomColor) {
      return this;
    }
    return CustomColor(
      backgroundPrimaryColor:
          Color.lerp(backgroundPrimaryColor, other.backgroundPrimaryColor, t)!,
    );
  }
}
