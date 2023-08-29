import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swapit_app/models/wishlist_item.dart';

import '../data/user1_wl.dart';

class WishListProvider extends ChangeNotifier {
  final List<WishListItem> _wishList = [...dummyWishlistItems];

  List<WishListItem> get wishList => _wishList;

  void addItem(WishListItem item) {
    _wishList.add(item);
    notifyListeners();
  }

  void removeItem(WishListItem item) {
    _wishList.remove(item);
    notifyListeners();
  }

  bool isItemInWishList(WishListItem item) {
    return _wishList.contains(item);
  }
}

final wishListProvider = ChangeNotifierProvider((ref) => WishListProvider());
