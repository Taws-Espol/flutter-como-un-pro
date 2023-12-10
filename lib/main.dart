import 'package:flutter/material.dart';
import 'package:flutter_como_un_pro/app/modules/home/home_page.dart';
import 'package:flutter_como_un_pro/core/theme/dark_theme.dart';
import 'package:flutter_como_un_pro/core/theme/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: LightTheme().theme,
      // theme: DarkTheme().theme,
      theme: LightTheme().theme,
      // darkTheme: DarkTheme().theme,
      home: const HomePage(),
    );
  }
}
