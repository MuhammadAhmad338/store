// ignore_for_file: file_names, must_be_immutable
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mystore/pages/addPage.dart';
import 'package:mystore/pages/cartPage.dart';
import 'package:mystore/pages/homePage.dart';
import 'package:mystore/pages/profilePage.dart';
import 'package:mystore/pages/searchPage.dart';
import 'package:mystore/utils/bottomNavigationBar.dart';
import 'package:provider/provider.dart';
import '../services/mainServices.dart';
import 'myFavourites.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  List<Widget> pageList = [
    const HomePage(),
    const SearchPage(),
    const Favourites(),
    const CartPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MainServices>(context);
    return Scaffold(
      body: pageList[provider.pageIndex],
      bottomNavigationBar: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomBar(
                onTap: () {
                  provider.changeIndex(0);
                },
                icon: Ionicons.home,
              ),
              BottomBar(
                onTap: () {
                  provider.changeIndex(1);
                },
                icon: Ionicons.search,
              ),
              BottomBar(
                onTap: () {
                  provider.changeIndex(2);
                },
                icon: Ionicons.heart_circle_outline,
              ),
              BottomBar(
                onTap: () {
                  provider.changeIndex(3);
                },
                icon: Ionicons.cart,
              ),
              BottomBar(
                onTap: () {
                  provider.changeIndex(4);
                },
                icon: Ionicons.menu,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
