// ignore_for_file: file_names
import 'package:flutter/material.dart';

class ThemeService extends ChangeNotifier {
  bool _isDarkModeEnabled = false;
  bool get isDarkModeEnabled => _isDarkModeEnabled;
  ThemeData get themeData => _isDarkModeEnabled ? darkTheme : lightTheme;

  void toggleTheme() {
    _isDarkModeEnabled = !_isDarkModeEnabled;
    notifyListeners();
  }

  final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    fontFamily: 'Tilt Neon',
  );

  final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: Colors.orange,
    fontFamily: 'Tilt Neon',
  );
}
