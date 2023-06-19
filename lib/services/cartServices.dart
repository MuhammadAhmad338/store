import 'package:flutter/material.dart';
import 'package:mystore/models/sneakers.dart';

class CartServices extends ChangeNotifier {
  final List<Sneaker> _cart = [];
  List<Sneaker> get cart => _cart;
  double _totalAmount = 0;
  double get totalAmount => _totalAmount;
  bool _switchValue = false;
  bool get switchValue => _switchValue;

  void removeItemFromCart(int id) {
    _cart.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  //Here we are clearing our cart thoroughly
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  //Here we are adding the items in our cart bucket
  void addToCart(Sneaker sneaker, BuildContext context) {
    _cart.add(sneaker);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Added to cart'),
        duration: Duration(seconds: 2),
      ),
    );
    notifyListeners();
  }

  //Here you can increase the cart item count
  void increaseCount(Sneaker sneaker) {
    sneaker.quantity = sneaker.quantity + 1;
    notifyListeners();
  }

  //Here you can decrease the cart item count
  void decreaseCount(Sneaker sneaker) {
    if (sneaker.quantity > 1) {
      sneaker.quantity = sneaker.quantity - 1;
    }
    notifyListeners();
  }

  void switchSwitch() {
    _switchValue = !_switchValue;
    notifyListeners();
  }

  void calculateTotalAmount() {
    for (var item in _cart) {
      _totalAmount += (item.price * item.quantity) as double;
    }
    notifyListeners();
  }

}
