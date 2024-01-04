import 'package:flutter_como_un_pro/app/modules/modules.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: HomePage.routeName,
      builder: (context, state) => const HomePage(),
    ),
  ],
);
