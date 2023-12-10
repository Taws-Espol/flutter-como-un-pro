import 'package:flutter/material.dart';
import 'package:flutter_como_un_pro/app/modules/home/home_page.dart';
import 'package:flutter_como_un_pro/core/theme/dark_theme.dart';
import 'package:flutter_como_un_pro/core/theme/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: DarkTheme().theme,
      theme: LightTheme().theme,
      home: const HomePage(),
    );
  }
}
