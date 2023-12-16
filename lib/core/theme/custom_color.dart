import 'package:flutter/material.dart';

const colorLight = CustomColor(
  backgroundPrimaryColor: Color(0xffffffff),
  backgroundSecondaryColor: Color(0xffffffff),
);

const colorDark = CustomColor(
  backgroundPrimaryColor: Color(0xff333333),
  backgroundSecondaryColor: Color(0xff333333),
);

class CustomColor extends ThemeExtension<CustomColor> {
  const CustomColor({
    required this.backgroundPrimaryColor,
    required this.backgroundSecondaryColor,
  });

  final Color backgroundPrimaryColor;
  final Color backgroundSecondaryColor;

  // https://palx.jxnblk.com/
  //Ejemplo: Generar paleta con este color 3897F0

  @override
  CustomColor copyWith({
    Color? backgroundPrimaryColor,
    Color? backgroundSecondaryColor,
  }) {
    return CustomColor(
      backgroundPrimaryColor:
          backgroundPrimaryColor ?? this.backgroundPrimaryColor,
      backgroundSecondaryColor:
          backgroundSecondaryColor ?? this.backgroundSecondaryColor,
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
      backgroundSecondaryColor: Color.lerp(
          backgroundSecondaryColor, other.backgroundSecondaryColor, t)!,
    );
  }
}
