// ignore: file_names
// ignore: duplicate_ignore
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:googleapis/androidenterprise/v1.dart';
import 'package:http/http.dart' as http;
import 'package:mystore/models/product.dart';

class HelperServices extends ChangeNotifier {
  double _value = 0;
  double get value => _value;
  List<Product> _product = [];
  List<Product> get product => _product;

  var imagesList = [
    "assets/images/hair-clipper.png",
    "assets/images/headphones.png",
    "assets/images/trimmer.png"
  ];

  Future<List<ProductModel>?> getProducts() async {
    var response = await http.get(Uri.parse("https://webappoo7.onrender.com/products/getProducts"));
    if (response.statusCode == 200) {
      List<dynamic> products = jsonDecode(response.body);
      var productsList = products.map((product) => ProductModel.fromMap(product)).toList();
      print("Got products ==> ${productsList}");
      return productsList;
    } else {
      print("Some error occured!");
    }
    return null;
  }


  void sliderState(double newValue) {
    _value = newValue;
    notifyListeners();
  }
}
