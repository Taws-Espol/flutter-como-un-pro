import 'package:flutter/material.dart';
import 'package:flutter_como_un_pro/app/providers/providers.dart';
import 'package:flutter_como_un_pro/config/router/app_router.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BeverageProvider>(
          create: (_) => BeverageProvider(),
        ),
        ChangeNotifierProvider<ShoppingCartProvider>(
          create: (_) => ShoppingCartProvider(),
        )
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Caramel Coffee',
        routerConfig: appRouter,
        theme: Provider.of<ThemeProvider>(context).getTheme(),
      ),
    );
  }
}
