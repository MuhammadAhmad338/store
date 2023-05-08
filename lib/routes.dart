import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mystore/pages/mainPage.dart';
import 'package:mystore/pages/productByCat.dart';
import 'pages/homePage.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => MainPage(),
    ),
    GoRoute(
      path: "/home",
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: "/search",
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: "/add",
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: "/cart",
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: "/profile",
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: "/productByCat",
      builder: (BuildContext context, GoRouterState state)  {
        final imageUrl = state.queryParametersAll["imageUrl"];
        final title =   state.queryParameters["title"];
        final price = state.queryParameters["price"];

        print(imageUrl);
        return ProductByCat(title: title!, price: price!, imageUrl: imageUrl!);
      }
    )
  ],
);
