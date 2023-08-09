import 'package:swapit_app/models/location.dart';

class User {
  final String uid;
  final List<Location> locations = [];
  User({required this.uid});
}
