import 'package:flutter/material.dart';

CustomText textDark = const CustomText(
  bodyText1Bold: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
    color: Colors.blue,
  ),
  bodyText2Bold: TextStyle(),
);

CustomText textlight = const CustomText(
  bodyText1Bold: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
    color: Colors.red,
  ),
  bodyText2Bold: TextStyle(),
);

class CustomText extends ThemeExtension<CustomText> {
  const CustomText({
    required this.bodyText1Bold,
    required this.bodyText2Bold,
  });

  final TextStyle bodyText1Bold;
  final TextStyle bodyText2Bold;

  @override
  CustomText copyWith({
    TextStyle? bodyText1Bold,
    TextStyle? bodyText2Bold,
  }) {
    return CustomText(
      bodyText1Bold: bodyText1Bold ?? this.bodyText1Bold,
      bodyText2Bold: bodyText2Bold ?? this.bodyText2Bold,
    );
  }

  @override
  CustomText lerp(ThemeExtension<CustomText>? other, double t) {
    if (other is! CustomText) {
      return this;
    }
    return CustomText(
      bodyText1Bold: TextStyle.lerp(bodyText1Bold, other.bodyText1Bold, t)!,
      bodyText2Bold: TextStyle.lerp(bodyText2Bold, other.bodyText2Bold, t)!,
    );
  }
}
