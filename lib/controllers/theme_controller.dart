import 'package:flutter/material.dart';

class ThemeController with ChangeNotifier {
  ThemeMode _mode = ThemeMode.light;

  ThemeMode get mode => _mode;

  void changeTheme() {
    if(_mode == ThemeMode.light) {
      _mode = ThemeMode.dark;
    } else {
      _mode = ThemeMode.light;
    }

    notifyListeners();
  }
}