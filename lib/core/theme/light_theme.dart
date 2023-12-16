import 'package:flutter/material.dart';
import 'package:flutter_como_un_pro/core/theme/custom_color.dart';
import 'package:flutter_como_un_pro/core/theme/custom_text.dart';

class LightTheme {
  final ThemeData theme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: 14),
    ),
    appBarTheme: appBarTheme,
    bottomNavigationBarTheme: bottomNavigationBarTheme,
    extensions: [
      colorLight,
      textDark,
    ],
  );

  static const appBarTheme = AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.brown,
    titleTextStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  );

  static const bottomNavigationBarTheme = BottomNavigationBarThemeData(
    backgroundColor: Color(0xffD9D9D9),
    selectedItemColor: Color(0xffC78D35),
    selectedIconTheme: IconThemeData(size: 30),
    selectedLabelStyle: TextStyle(
      fontWeight: FontWeight.bold,
    ),
  );
}
