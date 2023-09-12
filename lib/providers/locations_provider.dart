/// LocationsProvider
/// saves the locations in the local storage (shared pref)
/// and provides the locations to the app
///
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swapit_app/models/location.dart';
import 'package:swapit_app/utilities/shared_pref.dart';
import 'dart:convert';

// ignore: constant_identifier_names
const String LOCATIONS_KEY = 'locations';

class LocationsProvider extends ChangeNotifier {
  List<Location> locations = [];

  LocationsProvider() {
    loadLocations();
  }

  void addLocation(Location location) {
    locations.add(location);
    SharedPrefs.setStringList(
        LOCATIONS_KEY,
        locations
            .map((e) => jsonEncode(e.toJson()))
            .toList()); // Encode Map to JSON String
    notifyListeners();
  }

  void removeLocation(Location location) {
    locations.remove(location);
    SharedPrefs.setStringList(
        LOCATIONS_KEY,
        locations
            .map((e) => jsonEncode(e.toJson()))
            .toList()); // Encode Map to JSON String
    notifyListeners();
  }

  void loadLocations() {
    List<String>? locationsJson = SharedPrefs.getStringList(LOCATIONS_KEY);
    if (locationsJson != null) {
      locations = locationsJson
          .map((e) => Location.fromJson(jsonDecode(e)))
          .toList(); // Decode JSON String to Map
    }
  }
}

final locationsProvider =
    ChangeNotifierProvider<LocationsProvider>((ref) => LocationsProvider());
