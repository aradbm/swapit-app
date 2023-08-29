import 'dart:math';

class Location {
  const Location({
    required this.latitude,
    required this.longitude,
    this.name = 'user location',
  });
  final double latitude;
  final double longitude;
  final String name;

  double distanceTo(Location other) {
    // returns distance in km
    final double lat1 = latitude * pi / 180;
    final double lat2 = other.latitude * pi / 180;
    final double lon1 = longitude * pi / 180;
    final double lon2 = other.longitude * pi / 180;
    final double dLat = lat2 - lat1;
    final double dLon = lon2 - lon1;
    final double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(lat1) * cos(lat2) * sin(dLon / 2) * sin(dLon / 2);
    final double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return 6371 * c;
  }
}
