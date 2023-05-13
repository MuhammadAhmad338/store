import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mystore/pages/addPage.dart';
import 'package:mystore/pages/cartPage.dart';
import 'package:mystore/pages/mainPage.dart';
import 'package:mystore/pages/productByCat.dart';
import 'package:mystore/pages/product_page.dart';
import 'package:mystore/pages/profilePage.dart';
import 'package:mystore/pages/searchPage.dart';
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
      builder: (context, state) {
        final imageUrl = state.queryParametersAll["imageUrl"];
        final title = state.queryParameters["title"];
        final name = state.queryParameters["name"];
        final category = state.queryParameters["category"];
        final price = state.queryParameters["price"];
        final description = state.queryParameters["description"];
        final sizes = state.queryParametersAll["sizes"];
        return  ProductPage(images: imageUrl!, title: title!, price: price!,
            description: description!, sizes: sizes!, name: name!, category: category!,);
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
