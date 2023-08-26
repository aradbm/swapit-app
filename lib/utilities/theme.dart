import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSwatch(
  primarySwatch: Colors.purple,
  accentColor: Colors.purpleAccent,
  cardColor: const Color(0xFFF1E6FF),
  backgroundColor: const Color(0xFFE9E9E9),
  errorColor: const Color(0xFFB00020),
  brightness: Brightness.light,
);

ThemeData theme = ThemeData().copyWith(
  useMaterial3: true,
  colorScheme: kColorScheme,
);

ThemeData darkTheme = ThemeData().copyWith(
    useMaterial3: true, colorScheme: kColorScheme, brightness: Brightness.dark);
