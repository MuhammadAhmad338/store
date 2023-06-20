import 'package:flutter/material.dart';
import 'package:mystore/pages/favoritePage.dart';
import 'package:mystore/pages/homePage.dart';
import 'package:mystore/pages/profilePage.dart';
import 'cartPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysShow;

  var destinations = [
    const HomePage(),
    const FavoritePage(),
    const CartPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: destinations[currentIndex],
      bottomNavigationBar: NavigationBar(
          selectedIndex: currentIndex,
          onDestinationSelected: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(
                icon: Icon(Icons.favorite), label: 'Favourite'),
            NavigationDestination(
                icon: Icon(Icons.shopping_cart), label: 'Shopping Cart'),
            NavigationDestination(
                icon: Icon(Icons.person), label: 'Person')
          ]),
    );
  }
}
