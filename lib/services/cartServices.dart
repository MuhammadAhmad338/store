// ignore_for_file: file_names
import 'package:flutter/material.dart';
import '../models/product.dart';

class CartServices extends ChangeNotifier {

  List<ProductModel> _product = [];
  List<ProductModel> get product => _product;

  void addToCart(ProductModel productModel, BuildContext context) {
    _product.add(productModel);
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Product Added!"))
    );
    notifyListeners();
  }

  void removeItemFromCart(int index) {
    _product.remove(_product[index]);
    notifyListeners();
  }

  void increaseQuantity(int index) {
    _product[index].yourProductQuantity++;
    notifyListeners();
  }

  void decreaseQuantity(int index) {
    if (_product[index].yourProductQuantity > 0) {
      _product[index].yourProductQuantity--;
      notifyListeners();
    }
  }
}
