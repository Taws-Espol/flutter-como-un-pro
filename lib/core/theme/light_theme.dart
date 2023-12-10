import 'package:flutter/material.dart';
import 'package:flutter_como_un_pro/core/theme/custom_color.dart';
import 'package:flutter_como_un_pro/core/theme/custom_text.dart';

class LightTheme {
  final ThemeData theme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      // titleLarge: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(fontSize: 14),
    ),
    // appBarTheme: AppBarTheme,
    appBarTheme: appBarTheme,
    bottomNavigationBarTheme: bottomNavigationBarTheme,
    textButtonTheme: textButtonTheme,
    extensions: [
      colorLight,
      textlight,
    ],
  );

  static final textButtonTheme = TextButtonThemeData(
    style: ButtonStyle(
      // backgroundColor: MaterialStateProperty.all(Colors.red),
      foregroundColor: MaterialStateProperty.all(Color(0xffC78D35)),
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
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
