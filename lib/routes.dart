import 'package:go_router/go_router.dart';
import 'package:mystore/pages/mainPage.dart';
import 'pages/homePage.dart';

final GoRouter router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const MainPage(),
    ),
    GoRoute(
      path: "/home",
      builder: (context, state) => const HomePage(),
    ),
  ],
);
