// ignore_for_file: file_names
import 'package:flutter/material.dart';

class MainServices extends ChangeNotifier {
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;

  void changeIndex(int pageIndex) {
    _pageIndex = pageIndex;
    notifyListeners();
  }
}
