import 'dart:ui';

import 'package:flutter/foundation.dart';

enum Categories {
  jeans,
  shirt,
  shoes,
  accessories,
}

class WishListItem {
  const WishListItem({
    required this.desc,
    required this.color,
    required this.lowPrice,
    required this.highPrice,
    required this.image,
    required this.category,
  });

  final Category category;
  final String desc;
  final Color color;
  final int lowPrice;
  final int highPrice;
  final String image;
}
