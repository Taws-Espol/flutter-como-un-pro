import 'package:flutter/material.dart';
import 'package:flutter_como_un_pro/app/modules/home/home_page.dart';
import 'package:flutter_como_un_pro/app/providers/theme_provider.dart';
import 'package:flutter_como_un_pro/core/theme/light_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider(LightTheme().theme), // Tema por defecto
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Provider.of<ThemeProvider>(context).getTheme(),
      home: const HomePage(),
    );
  }
}
