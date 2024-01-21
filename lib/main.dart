import 'package:flutter/material.dart';
import 'package:flutter_como_un_pro/app/providers/providers.dart';
import 'package:flutter_como_un_pro/core/config/router/app_router.dart';
import 'package:flutter_como_un_pro/core/theme/dark_theme.dart';
import 'package:flutter_como_un_pro/core/theme/light_theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BeverageProvider>(
          create: (_) => BeverageProvider(),
        ),
        ChangeNotifierProvider<ShoppingCartProvider>(
          create: (_) => ShoppingCartProvider(),
        )
      ],
      child: FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (_, prefs) {
          final isDarkMode = prefs.data?.getBool("isDarkMode") ?? false;
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Caramel Coffee',
            routerConfig: appRouter,
            theme: isDarkMode ? DarkTheme().theme : LightTheme().theme,
          );
        },
      ),
    );
  }
}
