import 'dart:io';

import 'package:flutter/material.dart';

import 'location.dart';

enum Categories {
  jeans,
  shirt,
  shoes,
  accessories,
}



class BackPackItem {
  const BackPackItem({
    required this.id,
    required this.name,
    required this.desc,
    required this.color,
    required this.price,
    required this.image,
    required this.location,
  });

  final String id;
  final String name;
  final String desc;
  final Color color;
  final int price;
  final File image;
  final Location location;
}
