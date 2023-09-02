import 'package:flutter/material.dart';

// Unique Light Theme
ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: const Color(0xFFF7F2E0),
  appBarTheme: const AppBarTheme(
    color: Color(0xFFFFA07A),
    iconTheme: IconThemeData(
      color: Color(0xFF2E3440),
    ),
  ),
  colorScheme: const ColorScheme.light(
    primary: Color(0xFFFFA07A),
    onPrimary: Color(0xFF2E3440),
    secondary: Color(0xFF48D1CC),
    onSecondary: Color(0xFF2E3440),
  ),
  cardTheme: const CardTheme(
    color: Color(0xFFEDEDED),
  ),
  iconTheme: const IconThemeData(
    color: Color(0xFF2E3440),
  ),
  textTheme: const TextTheme().apply(
    bodyColor: const Color(0xFF2E3440),
    displayColor: const Color(0xFF2E3440),
  ),

  // Button Theme
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFFFFA07A),
    textTheme: ButtonTextTheme.primary,
  ),

  // Input Decoration Theme
  inputDecorationTheme: const InputDecorationTheme(
    fillColor: Color(0xFFEDEDED),
    filled: true,
  ),

  // SnackBar Theme
  snackBarTheme: const SnackBarThemeData(
    backgroundColor: Color(0xFF48D1CC),
    contentTextStyle: TextStyle(color: Color(0xFFFFFFFF)),
  ),

  // TabBar Theme
  tabBarTheme: const TabBarTheme(
    labelColor: Color(0xFF2E3440),
    unselectedLabelColor: Color(0xFF6C757D),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFFFFA07A),
    selectedItemColor: Color(0xFF2E3440),
    unselectedItemColor: Color(0xFF2E3440),
  ),
);

// Unique Dark Theme
final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: const Color(0xFF2E3440),
  appBarTheme: const AppBarTheme(
    color: Color(0xFF00CED1),
    iconTheme: IconThemeData(
      color: Color(0xFFF7F2E0),
    ),
  ),
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF00CED1),
    onPrimary: Color(0xFFF7F2E0),
    secondary: Color(0xFF8A2BE2),
    onSecondary: Color(0xFFF7F2E0),
  ),
  cardTheme: const CardTheme(
    color: Color(0xFF3B4252),
  ),
  iconTheme: const IconThemeData(
    color: Color(0xFF88C0D0),
  ),
  textTheme: const TextTheme().apply(
    bodyColor: const Color(0xFFECEFF4),
    displayColor: const Color(0xFFECEFF4),
  ),

  // Button Theme
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFF00CED1),
    textTheme: ButtonTextTheme.primary,
  ),

  // Input Decoration Theme
  inputDecorationTheme: const InputDecorationTheme(
    fillColor: Color(0xFF3B4252),
    filled: true,
  ),

  // SnackBar Theme
  snackBarTheme: const SnackBarThemeData(
    backgroundColor: Color(0xFF8A2BE2),
    contentTextStyle: TextStyle(color: Color(0xFFFFFFFF)),
  ),

  // TabBar Theme
  tabBarTheme: const TabBarTheme(
    labelColor: Color(0xFFECEFF4),
    unselectedLabelColor: Color(0xFF88C0D0),
  ),
);
