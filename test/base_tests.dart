import 'package:flutter/material.dart';
import 'package:flutter_como_un_pro/app/providers/providers.dart';
import 'package:flutter_como_un_pro/core/theme/light_theme.dart';
import 'package:provider/provider.dart';

class BaseTest {
  static Widget testApp(Widget? element) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BeverageProvider>(
          create: (_) => BeverageProvider(),
        ),
        ChangeNotifierProvider<ShoppingCartProvider>(
          create: (_) => ShoppingCartProvider(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => ThemeProvider(isDarkMode: false),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: element,
        ),
      ),
    );
  }
}
