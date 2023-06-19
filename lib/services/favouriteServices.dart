// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import '../models/sneakers.dart';

class FavouriteServices with ChangeNotifier {
  final List<Sneaker> _favSneakers = [];
  List<Sneaker> get favSneakers => _favSneakers;
  bool _isFavourite = false;
  bool get isFavourite => _isFavourite;

  void setFavourite() {
    _isFavourite = !_isFavourite;
    notifyListeners();
  }

  void setSneakers(Sneaker value) {
    _favSneakers.add(value);
    notifyListeners();
  }

  void removeSneakers(Sneaker value) {
    _favSneakers.remove(value);
    notifyListeners();
  }
}
