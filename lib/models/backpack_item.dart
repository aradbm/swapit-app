import 'dart:math';

import 'package:flutter/material.dart';

const defualtlatitude = 32.085300;
const defualtlongitude = 34.781769;

class BackPackItem {
  BackPackItem({
    required this.itemid,
    required this.title,
    required this.categoryid,
    required this.uid,
    required this.color,
    required this.description,
    this.size,
    this.price,
    this.originalprice,
    this.latitude = defualtlatitude,
    this.longitude = defualtlongitude,
  });

  int itemid;
  final String uid;
  final String title;
  final Color? color;
  final int? price;
  final int? originalprice;
  final int categoryid;
  final String? description;
  final String? size;
  final double latitude;
  final double longitude;

  static Color getRandomColor() {
    final random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  set setItemID(int id) => itemid = id;

  // from json method
  factory BackPackItem.fromJson(Map<String, dynamic> json) {
    return BackPackItem(
      itemid: json['itemid'],
      uid: json['uid'],
      title: json['title'],
      color: Color(int.parse(json['color'])),
      price: json['price'],
      originalprice: json['originalprice'],
      categoryid: json['categoryid'],
      description: json['description'],
      size: json['size'],
      longitude: json['longitude'] ?? defualtlatitude,
      latitude: json['latitude'] ?? defualtlongitude,
    );
  }

  // to json method
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'title': title,
      'color': color?.value == null ? 0 : color!.value.toString(),
      'price': price,
      'originalprice': originalprice,
      'categoryid': categoryid,
      'description': description,
      'size': size,
      'longitude': longitude,
      'latitude': latitude,
    };
  }
}
