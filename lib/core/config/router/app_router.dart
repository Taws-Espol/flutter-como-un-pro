// import 'package:flutter_como_un_pro/app/modules/modules.dart';
import 'package:flutter_como_un_pro/presentation/screens/beverage_screen.dart';
import 'package:flutter_como_un_pro/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.routeName,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/beverage',
      name: BeverageScreen.routeName,
      builder: (context, state) {
        final String beverageCategoryName =
            state.extra != null ? (state.extra as Map)['beverageName'] : '';
        return BeverageScreen(
          beverageCategoryName: beverageCategoryName,
        );
      },
    ),
  ],
);
