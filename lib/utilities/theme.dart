import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSwatch(
  primarySwatch: Colors.purple,
  accentColor: Colors.purpleAccent,
  cardColor: const Color(0xFFF1E6FF),
  backgroundColor: const Color(0xFFE9E9E9),
  errorColor: const Color(0xFFB00020),
  // brightness: Brightness.light,
);

var kDarkColorScheme = ColorScheme.fromSwatch(
  primarySwatch: Colors.deepOrange,
  accentColor: Colors.deepOrangeAccent,
  cardColor: const Color.fromARGB(255, 0, 0, 0),
  backgroundColor: const Color(0xFFE9E9E9),
  errorColor: const Color(0xFFB00020),
  // brightness: Brightness.dark,
);

ThemeData theme = ThemeData().copyWith(
  useMaterial3: true,
  colorScheme: kColorScheme,
  brightness: Brightness.light,
);

ThemeData darkTheme = ThemeData().copyWith(
  useMaterial3: true,
  colorScheme: kDarkColorScheme,
  brightness: Brightness.dark,
);
