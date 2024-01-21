import 'package:flutter/material.dart';
import 'package:flutter_como_un_pro/core/theme/dark_theme.dart';
import 'package:flutter_como_un_pro/core/theme/light_theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData;

  ThemeProvider({required bool isDarkMode})
      : _themeData = isDarkMode ? DarkTheme().theme : LightTheme().theme;

  getTheme() => _themeData;

  setLightTheme() {
    _themeData = LightTheme().theme;
    notifyListeners();
  }

  setDarkTheme() {
    _themeData = DarkTheme().theme;
    notifyListeners();
  }
}
