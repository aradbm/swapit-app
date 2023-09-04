import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swapit_app/models/wishlist_item.dart';
import 'package:swapit_app/providers/user_provider.dart';
import '../models/user.dart';
import '../services/api.dart';

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

  Future<void> fetchWishList(String id) async {
    _wishList.clear();
    _wishList.addAll(await Api.getWishList(id));
    notifyListeners();
  }

  void addItem(WishListItem item) async {
    int id = await Api.uploadWishList(item);
    item.setItemID = id;
    _wishList.add(item);
    notifyListeners();
  }

  void removeItem(WishListItem item) {
    _wishList.remove(item);
    Api.deleteWishList(item);
    notifyListeners();
  }

  void updateItem(WishListItem item) async {
    int id = await Api.updateWishList(item);
    item.setItemID = id;
    int index = _wishList.indexWhere((element) => element.itemid == id);
    _wishList[index] = item;
    notifyListeners();
  }

  bool isItemInWishList(WishListItem item) {
    return _wishList.contains(item);
  }
}

final wishListProvider = ChangeNotifierProvider<WishListProvider>(
  (ref) {
    return WishListProvider(ref.watch(userProvider));
  },
);
