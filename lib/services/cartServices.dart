import 'package:flutter/material.dart';
import '../models/cart.dart';

class CartServices extends ChangeNotifier {

  List<Cart> _cart = [];
  List<Cart> get cart => _cart;

  void removeItemFromCart(String id) {
    _cart.where((element) => element.id == id);
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  void addToCart() {
   notifyListeners();
  }
}
