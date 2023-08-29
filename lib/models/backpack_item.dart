import 'package:flutter/material.dart';
import 'location.dart';

class BackPackItem {
  const BackPackItem(
    this.desc,
    this.color,
    this.image, {
    required this.id,
    required this.name,
    required this.price,
    required this.location,
    required this.category,
    required this.userID,
  });

  final String id;
  final String name;
  final String desc;
  final Color color;
  final int price;
  final String image;
  final Location location;
  final String category;
  final String userID;
}
