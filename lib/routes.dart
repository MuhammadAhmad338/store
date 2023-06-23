import 'package:go_router/go_router.dart';
import 'package:mystore/pages/mainPage.dart';
import 'package:mystore/pages/productPage.dart';

final GoRouter router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const MainPage(),
    ),
    GoRoute(
      path: "/productPage",
      builder: (context, state) => const ProductPage(),
    ),
  ],
);
