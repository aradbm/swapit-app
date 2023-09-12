class Location {
  final double latitude;
  final double longitude;
  final String locationname;
  final int id;
  bool isChosen;

  Location({
    required this.latitude,
    required this.longitude,
    this.locationname = 'user location',
    this.id = 0,
    this.isChosen = false,
  });

  void toggleIsChosen() {
    isChosen = !isChosen;
  }

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json['latitude'],
        longitude: json['longitude'],
        locationname: json['locationname'],
        id: json['id'] ?? 0,
        isChosen: json['isChosen'] ?? false,
      );

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'locationname': locationname,
      'id': id,
      'isChosen': isChosen,
    };
  }
}
