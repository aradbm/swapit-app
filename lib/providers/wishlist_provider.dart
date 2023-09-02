import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swapit_app/models/wishlist_item.dart';
import '../data/user1_wl.dart';

// router.get("/wishlists/:id", wishListController.getWishList);
// // create a new wishlist item for a user by id
// router.post("/wishlists", wishListController.createWishList);
// // update a wishlist item by id
// router.put("/wishlists/:id", wishListController.updateWishList);
// // delete a wishlist item by id
// router.delete("/wishlists/:id", wishListController.deleteWishList);
class WishListProvider extends ChangeNotifier {
  // fetch the wishlist items of the user from the database
  // and store them in this list

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
