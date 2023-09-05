import 'package:flutter/material.dart';

// Light Theme Colors (Pinky Purple, Green, and Matte Black that blends well with the background)
const Color lightScaffoldBackgroundColor = Color(0xFFF3F4F6);
const Color lightAppBarColor = Color.fromARGB(255, 255, 79, 144);
const Color lightIconColor = Color(0xFF2E2E2E);
const Color lightPrimaryColor = Color(0xFFD81B60);
const Color lightOnPrimaryColor = Color(0xFFFFFFFF);
const Color lightSecondaryColor = Color(0xFF66BB6A);
const Color lightOnSecondaryColor = Color(0xFFFFFFFF);
const Color lightCardColor = Color(0xFFF1F1F1);
const Color lightButtonColor = Color(0xFF2E2E2E);
const Color lightInputFillColor = Color(0xFFF1F1F1);
const Color lightSnackBarBackgroundColor = Color(0xFF66BB6A);
const Color lightTabLabelColor = Color(0xFF2E2E2E);
const Color lightTabUnselectedLabelColor = Color.fromARGB(255, 255, 255, 255);

// Dark Theme Basic Colors
const Color darkScaffoldBackgroundColor = Color(0xFF121212); // Near Black
const Color darkAppBarColor = Color(0xFF1E1E1E); // Dark gray
const Color darkIconColor = Color(0xFFBBBBBB); // Mid gray
const Color darkPrimaryColor = Color(0xFF2E2E2E); // Slightly darker gray
const Color darkOnPrimaryColor = Color(0xFFFFFFFF); // White
const Color darkSecondaryColor = Color(0xFF373737); // Even darker gray
const Color darkOnSecondaryColor = Color(0xFFFFFFFF); // White
const Color darkCardColor = Color(0xFF1E1E1E); // Dark gray
const Color darkButtonColor = Color(0xFF2E2E2E); // Slightly darker gray
const Color darkInputFillColor = Color(0xFF1E1E1E); // Dark gray
const Color darkSnackBarBackgroundColor = Color(0xFF373737); // Even darker gray
const Color darkTabLabelColor = Color(0xFFFFFFFF); // White
const Color darkTabUnselectedLabelColor = Color(0xFFBBBBBB); // Mid gray

// Updated Light Theme
ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: lightScaffoldBackgroundColor,
  appBarTheme: const AppBarTheme(
    color: lightAppBarColor,
    iconTheme: IconThemeData(
      color: lightIconColor,
    ),
  ),
  colorScheme: const ColorScheme.light(
    primary: lightPrimaryColor,
    onPrimary: lightOnPrimaryColor,
    secondary: lightSecondaryColor,
    onSecondary: lightOnSecondaryColor,
  ),
  cardTheme: const CardTheme(
    color: lightCardColor,
  ),
  iconTheme: const IconThemeData(
    color: lightIconColor,
  ),
  textTheme: const TextTheme().apply(
    bodyColor: lightIconColor,
    displayColor: lightIconColor,
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: lightButtonColor,
    textTheme: ButtonTextTheme.primary,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    fillColor: lightInputFillColor,
    filled: true,
  ),
  snackBarTheme: const SnackBarThemeData(
    backgroundColor: lightSnackBarBackgroundColor,
    contentTextStyle: TextStyle(color: Color(0xFFFFFFFF)),
  ),
  tabBarTheme: const TabBarTheme(
    labelColor: lightTabLabelColor,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: lightAppBarColor,
    selectedItemColor: lightIconColor,
    unselectedItemColor: lightTabUnselectedLabelColor,
  ),
);

// Updated Dark Theme
final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: darkScaffoldBackgroundColor,
  appBarTheme: const AppBarTheme(
    color: darkAppBarColor,
    iconTheme: IconThemeData(
      color: darkIconColor,
    ),
  ),
  colorScheme: const ColorScheme.dark(
    primary: darkPrimaryColor,
    onPrimary: darkOnPrimaryColor,
    secondary: darkSecondaryColor,
    onSecondary: darkOnSecondaryColor,
  ),
  cardTheme: const CardTheme(
    color: darkCardColor,
  ),
  iconTheme: const IconThemeData(
    color: darkIconColor,
  ),
  textTheme: const TextTheme().apply(
    bodyColor: darkIconColor,
    displayColor: darkIconColor,
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: darkButtonColor,
    textTheme: ButtonTextTheme.primary,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    fillColor: darkInputFillColor,
    filled: true,
  ),
  snackBarTheme: const SnackBarThemeData(
    backgroundColor: darkSnackBarBackgroundColor,
    contentTextStyle: TextStyle(color: Color(0xFFFFFFFF)),
  ),
  tabBarTheme: const TabBarTheme(
    labelColor: darkTabLabelColor,
    unselectedLabelColor: darkTabUnselectedLabelColor,
  ),
);
