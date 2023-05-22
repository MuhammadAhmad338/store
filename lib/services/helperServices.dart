// ignore: file_names
// ignore: duplicate_ignore
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as the_bundle;
import 'package:mystore/models/sneakers.dart';

class HelperServices extends ChangeNotifier {
  double _value = 0;
  double get value => _value;
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  int _count = 0;
  int get count => _count;
  List<dynamic> _shoes = [];
  List<dynamic> get shoes => _shoes;

  static Future<List<Sneaker>> getMaleData() async {
    final sneakerJson =
        await the_bundle.rootBundle.loadString('assets/json/men_shoes.json');
    final data = sneakersFromJson(sneakerJson);
    return data;
  }

  static Future<List<Sneaker>> getFemaleData() async {
    final sneakerJson =
        await the_bundle.rootBundle.loadString('assets/json/women_shoes.json');
    final data = sneakersFromJson(sneakerJson);
    return data;
  }

  static Future<List<Sneaker>> getKidsData() async {
    final sneakerJson =
        await the_bundle.rootBundle.loadString('assets/json/kids_shoes.json');
    final data = sneakersFromJson(sneakerJson);
    return data;
  }

  static Future<Sneaker> getMaleDataById(String id) async {
    final sneakerJson =
        await the_bundle.rootBundle.loadString('assets/json/men_shoes.json');
    final sneaker = sneakersFromJson(sneakerJson);
    final data = sneaker.firstWhere((element) => element.id == id);
    return data;
  }

  static Future<Sneaker> getFemaleDataById(String id) async {
    final sneakerJson =
        await the_bundle.rootBundle.loadString('assets/json/women_shoes.json');
    final sneaker = sneakersFromJson(sneakerJson);
    final data = sneaker.firstWhere((element) => element.id == id);
    return data;
  }

  static Future<Sneaker> getKidsDataById(String id) async {
    final sneakerJson =
        await the_bundle.rootBundle.loadString('assets/json/kids_shoes.json');
    final sneaker = sneakersFromJson(sneakerJson);
    final data = sneaker.firstWhere((element) => element.id == id);
    return data;
  }

  void sliderState(double newValue) {
    _value = newValue;
    notifyListeners();
  }

  set shoeSizes(List<dynamic> newShoes) {
    _shoes = newShoes;
    notifyListeners();
  }

  void toggleSelectedShoes(int index) {
    for (int i = 0; i < _shoes.length; i++) {
      if (i == index) {
        _shoes[index]['isSelected'] = !_shoes[index]['isSelected'];
      }
    }
  }

  void incrementCount() {
    _count++;
    notifyListeners();
  }

  void decrementCount() {
    if (_count > 0) {
      _count--;
      notifyListeners();
    }
  }

  void updateIndex(int newIndex) {
    _currentIndex = newIndex;
    notifyListeners();
  }


  
}
