import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_como_un_pro/app/providers/providers.dart';
import 'package:flutter_como_un_pro/core/config/router/app_router.dart';
import 'package:flutter_como_un_pro/core/services/shared_preferences/configuracion_storage.dart';
import 'package:flutter_como_un_pro/core/services/shared_preferences/shared_preferences_helper.dart';
import 'package:flutter_como_un_pro/core/theme/dark_theme.dart';
import 'package:flutter_como_un_pro/core/theme/light_theme.dart';
import 'package:flutter_como_un_pro/logic/cubit/beverage_cubit.dart';
import 'package:flutter_como_un_pro/logic/cubit/shopping_cart_cubit.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'logic/cubit/theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.initialize();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BeverageCubit()),
        BlocProvider(create: (_) => ShoppingCartCubit()),
        BlocProvider(create: (_) => ThemeCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeCubit>().state.themeData;

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Caramel Coffee',
      routerConfig: appRouter,
      theme: theme,
    );
  }
}
