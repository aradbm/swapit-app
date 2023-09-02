import 'dart:math';

import 'package:flutter/material.dart';

class BackPackItem {
  const BackPackItem({
    required this.itemID,
    required this.title,
    required this.category,
    required this.userID,
    required this.color,
    required this.description,
    required this.location,
    this.size,
    this.price,
    this.originalPrice,
  });

  final int itemID;
  final String userID;
  final String title;
  final Color? color;
  final int? price;
  final int? originalPrice;
  final int category;
  final String? description;
  final String? location;
  final String? size;

  static Color getRandomColor() {
    final random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  // from json method
  factory BackPackItem.fromJson(Map<String, dynamic> json) {
    print(json.toString());
    return BackPackItem(
      itemID: json['itemid'],
      userID: json['userid'],
      title: json['title'],
      color: Color(int.parse(json['color'])),
      price: json['price'],
      originalPrice: json['originalprice'],
      category: json['categoryid'],
      description: json['description'],
      location: json['location'],
      size: json['size'],
    );
  }

  // to json method
  Map<String, dynamic> toJson() {
    return {
      'userID': userID,
      'title': title,
      'color': color?.value == null ? 0 : color!.value.toString(),
      'price': price,
      'originalPrice': originalPrice,
      'category': category,
      'description': description,
      'location': location,
      'size': size,
    };
  }
}
