import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swapit_app/models/wishlist_item.dart';
import 'package:swapit_app/providers/user_provider.dart';
// import '../data/user1_wl.dart';
import '../models/user.dart';
import '../services/api.dart';

// router.get("/wishlists/:id", wishListController.getWishList);
// // create a new wishlist item for a user by id
// router.post("/wishlists", wishListController.createWishList);
// // update a wishlist item by id
// router.put("/wishlists/:id", wishListController.updateWishList);
// // delete a wishlist item by id
// router.delete("/wishlists/:id", wishListController.deleteWishList);
class WishListProvider extends ChangeNotifier {
  final List<WishListItem> _wishList = [];
  final AsyncValue<AppUser> _userAsyncValue;

  List<WishListItem> get wishList => _wishList;

  WishListProvider(this._userAsyncValue) {
    _userAsyncValue.when(
      data: (user) {
        fetchWishList(user.uid);
      },
      loading: () {},
      error: (err, stack) {},
    );
  }

  void fetchWishList(String id) async {
    _wishList.clear();
    _wishList.addAll(await Api.getWishList(id));
    notifyListeners();
  }

  void addItem(WishListItem item) {
    _wishList.add(item);
    Api.uploadWishList(item);
    // item.itemID = int.parse(id.toString()); // TODO: fix this
    notifyListeners();
  }

  void removeItem(WishListItem item) {
    _wishList.remove(item);
    Api.deleteWishList(item);
    notifyListeners();
  }

  void updateItem(WishListItem item) {
    Api.updateWishList(item);
    _wishList[_wishList
        .indexWhere((element) => element.itemID == item.itemID)] = item;
    notifyListeners();
  }

  bool isItemInWishList(WishListItem item) {
    return _wishList.contains(item);
  }
}

final wishListProvider =
    ChangeNotifierProvider.autoDispose<WishListProvider>((ref) {
  final user = ref.watch(userProvider);
  return WishListProvider(user);
});
