import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swapit_app/utilities/shared_pref.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = SharedPrefs.getBool('isDarkMode') ?? false
      ? ThemeMode.dark
      : ThemeMode.light;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    SharedPrefs.setBool('isDarkMode', isOn);
    notifyListeners();
  }

  bool isDarkMode() {
    return SharedPrefs.getBool('isDarkMode') ?? false;
  }
}

final themeProviderNotifier = ChangeNotifierProvider((ref) => ThemeProvider());
