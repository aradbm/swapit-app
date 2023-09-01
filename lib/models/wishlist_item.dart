import 'package:flutter/material.dart';

class WishListItem {
  const WishListItem({
    required this.itemID,
    required this.userID,
    required this.categoryID,
    required this.color,
    this.size,
    this.minPrice,
    this.maxPrice,
    this.description,
  });

  final String itemID;
  final String userID;
  final String categoryID;
  final Color color;
  final String? size;
  final int? minPrice;
  final int? maxPrice;
  final String? description;

  // to json and from json methods
  Map<String, dynamic> toJson() => {
        'itemID': itemID,
        'userID': userID,
        'categoryID': categoryID,
        'color': color.value,
        'size': size,
        'minPrice': minPrice,
        'maxPrice': maxPrice,
        'description': description,
      };

  factory WishListItem.fromJson(Map<String, dynamic> json) => WishListItem(
        itemID: json['itemID'],
        userID: json['userID'],
        categoryID: json['categoryID'],
        color: Color(json['color']),
        size: json['size'],
        minPrice: json['minPrice'],
        maxPrice: json['maxPrice'],
        description: json['description'],
      );

  Icon get getIcon {
    //   1 | Clothing            |              0
    //   2 | Accessories         |              0
    //   3 | Men's Clothing      |              1
    //   4 | Women's Clothing    |              1
    //   5 | Children's Clothing |              1
    //   6 | Unisex Clothing     |              1
    //   7 | Formal Wear         |              1
    //   8 | Casual Wear         |              1
    //   9 | Sportswear          |              1
    //  10 | Winter Clothing     |              1
    //  11 | Summer Clothing     |              1
    //  12 | Underwear           |              1
    //  13 | Swimwear            |              1
    //  14 | Watches             |              2
    //  15 | Handbags            |              2
    //  16 | Jewelry             |              2
    //  17 | Belts               |              2
    //  18 | Scarves             |              2
    //  19 | Sunglasses          |              2
    //  20 | Hats                |              2
    //  21 | Gloves              |              2
    //  22 | Wallets             |              2
    //  23 | Men's Shirts        |              3
    //  24 | Men's Trousers      |              3
    //  25 | Men's Shoes         |              3
    //  26 | Women's Tops        |              4
    //  27 | Women's Skirts      |              4
    //  28 | Women's Dresses     |              4
    //  29 | Boys' Clothing      |              5
    //  30 | Girls' Clothing     |              5
    //  31 | Digital Watches     |             12
    //  32 | Analog Watches      |             12
    //  33 | Tote Bags           |             13
    //  34 | Clutch Bags         |             13
    //  35 | Necklaces           |             14
    //  36 | Bracelets           |             14
    //  37 | Earrings            |             14

    switch (int.parse(categoryID)) {
      case 1:
        return const Icon(Icons.indeterminate_check_box);
      case 2:
        return const Icon(Icons.headphones);
      case 3:
        return const Icon(Icons.abc_sharp);
      case 4 || 5 || 6 || 7 || 8 || 9 || 10 || 11 || 12 || 13:
        return const Icon(Icons.person_off_outlined);
      case 14:
        return const Icon(Icons.watch);
      case 15:
        return const Icon(Icons.backpack);
      case 16:
        return const Icon(Icons.biotech);
      case 17:
        return const Icon(Icons.headphones_sharp);
      default:
        return const Icon(Icons.accessibility_new);
    }
  }
}