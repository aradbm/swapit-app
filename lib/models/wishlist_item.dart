import 'dart:ui';

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
}
