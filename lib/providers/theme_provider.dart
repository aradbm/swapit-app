import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  bool isDarkMode() {
    return themeMode == ThemeMode.dark;
  }
}

final themeProviderNotifier = ChangeNotifierProvider((ref) => ThemeProvider());

// class ThemeNotifier extends ChangeNotifier {
//   final String key = "theme";
//   SharedPreferences _prefs;
//   bool _darkTheme;

//   bool get darkTheme => _darkTheme;

//   ThemeNotifier() {
//     _darkTheme = true;
//     _loadFromPrefs();
//   }

//   toggleTheme() {
//     _darkTheme = !_darkTheme;
//     _saveToPrefs();
//     notifyListeners();
//   }

//   _initPrefs() async {
//     if (_prefs == null) _prefs = await SharedPreferences.getInstance();
//   }

//   _loadFromPrefs() async {
//     await _initPrefs();
//     _darkTheme = _prefs.getBool(key) ?? true;
//     notifyListeners();
//   }

//   _saveToPrefs() async {
//     await _initPrefs();
//     _prefs.setBool(key, _darkTheme);
//   }
// }