import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_como_un_pro/app/providers/authentication/authentication_provider.dart';
import 'package:flutter_como_un_pro/app/providers/providers.dart';
import 'package:flutter_como_un_pro/core/config/router/app_router.dart';
import 'package:flutter_como_un_pro/core/services/shared_preferences/configuracion_storage.dart';
import 'package:flutter_como_un_pro/core/services/shared_preferences/shared_preferences_helper.dart';
import 'package:flutter_como_un_pro/core/theme/dark_theme.dart';
import 'package:flutter_como_un_pro/core/theme/light_theme.dart';
import 'package:flutter_como_un_pro/firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // if (kDebugMode) {
  //   try {
  //     FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8086);
  //     await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  //   } catch (e) {
  //     // ignore: avoid_print
  //     print(e);
  //   }
  // }

  await SharedPreferencesHelper.initialize();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticationProvider>(
          create: (_) => AuthenticationProvider(),
        ),
        ChangeNotifierProvider<BeverageProvider>(
          create: (_) => BeverageProvider(),
        ),
        ChangeNotifierProvider<ShoppingCartProvider>(
          create: (_) => ShoppingCartProvider(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => ThemeProvider(
            isDarkMode: ConfiguracionStorage.isDarkMode,
          ),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Caramel Coffee',
      routerConfig: appRouter,
      theme: themeProvider.getTheme(),
    );
  }
}
