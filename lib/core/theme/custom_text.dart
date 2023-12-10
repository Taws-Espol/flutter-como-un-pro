// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_como_un_pro/core/theme/custom_color.dart';

CustomText textDark = const CustomText(
  bodyText1_bold: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
    color: Colors.blue,
  ),
  bodyText2_bold: TextStyle(),
);

CustomText textlight = const CustomText(
  bodyText1_bold: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
    color: Colors.red,
  ),
  bodyText2_bold: TextStyle(),
);

class CustomText extends ThemeExtension<CustomText> {
  const CustomText({
    required this.bodyText1_bold,
    required this.bodyText2_bold,
  });

  final TextStyle bodyText1_bold;
  final TextStyle bodyText2_bold;

  @override
  CustomText copyWith({
    TextStyle? bodyText1_bold,
  }) {
    return CustomText(
      bodyText1_bold: bodyText1_bold ?? this.bodyText1_bold,
      bodyText2_bold: bodyText2_bold ?? this.bodyText2_bold,
    );
  }

  @override
  CustomText lerp(ThemeExtension<CustomText>? other, double t) {
    if (other is! CustomText) {
      return this;
    }
    return CustomText(
      bodyText1_bold: TextStyle.lerp(bodyText1_bold, other.bodyText1_bold, t)!,
      bodyText2_bold: TextStyle.lerp(bodyText2_bold, other.bodyText2_bold, t)!,
    );
  }
}
