import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mystore/models/sneakers.dart';
import 'package:mystore/pages/addPage.dart';
import 'package:mystore/pages/cartPage.dart';
import 'package:mystore/pages/productByCat.dart';
import 'package:mystore/pages/product_page.dart';
import 'package:mystore/pages/profilePage.dart';
import 'package:mystore/pages/searchPage.dart';
import 'pages/homePage.dart';
import 'pages/signInPage.dart';

final GoRouter router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      path: "/home",
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: "/search",
      builder: (context, state) => const SearchPage(),
    ),
    GoRoute(
      path: "/add",
      builder: (context, state) => const AddPage(),
    ),
    GoRoute(
      path: "/cart",
      builder: (context, state) => const CartPage(),
    ),
    GoRoute(
      path: "/profile",
      builder: (context, state) => const ProfilePage(),
    ),
    GoRoute(
      path: "/productPage",
      builder: (BuildContext context, GoRouterState state) {
        var sneaker = state.extra! as Sneaker;
        print(sneaker);
        return  ProductPage(sneaker: sneaker);
      }
    ),
    GoRoute(
      path: "/productByCat",
      builder: (BuildContext context, GoRouterState state)  {
        final imageUrl = state.queryParametersAll["imageUrl"];
        final title =   state.queryParameters["title"];
        final price = state.queryParameters["price"];

        return ProductByCat(title: title!, price: price!, imageUrl: imageUrl!);
      }
    )
  ],
);
