import 'dart:ui';

class WishListItem {
  const WishListItem(
    this.color,
    this.size,
    this.lowPrice,
    this.highPrice,
    this.image, {
    required this.userID,
    required this.category,
  });

  final String userID;
  final String category;
  final Color color;
  final String size;
  final int lowPrice;
  final int highPrice;
  final String image;
}
