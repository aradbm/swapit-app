import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.teal);
// var kColorScheme = ColorScheme.fromSwatch(
//   primarySwatch: Colors.blue,
//   accentColor: Colors.teal,
//   brightness: Brightness.dark,
// );

ThemeData theme = ThemeData().copyWith(
  useMaterial3: true,
  colorScheme: kColorScheme,
);
