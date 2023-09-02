import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swapit_app/models/backpack_item.dart';
import 'package:swapit_app/providers/user_provider.dart';
import '../models/user.dart';
import '../services/api.dart';

// the node.js backend has the following routes:
// get backpack items for a user with a specific id
// router.get("/backpacks/:id", backPackController.getBackPack);
// get a backpack item by id
// router.get("/backpacks/item/:id", backPackController.getBackPackItem);
// create a new backpack item
// router.post("/backpacks", backPackController.createBackPack);
// update a backpack item
// router.put("/backpacks/:id", backPackController.updateBackPack);
// delete a backpack item
// router.delete("/backpacks/:id", backPackController.deleteBackPack);

class BackPackProvider extends ChangeNotifier {
  final List<BackPackItem> _items = [];
  final AsyncValue<AppUser> _userAsyncValue;

  List<BackPackItem> get items => _items;

  BackPackProvider(this._userAsyncValue) {
    _userAsyncValue.when(
      data: (user) {
        fetchBackPack(user.uid);
      },
      loading: () {},
      error: (err, stack) {},
    );
  }

  void fetchBackPack(String id) async {
    _items.clear();
    _items.addAll(await Api.getBackPack(id));
    notifyListeners();
  }

  void addItem(BackPackItem item) {
    _items.add(item);
    Api.uploadBackPack(item);
    notifyListeners();
  }

  void removeItem(BackPackItem item) {
    _items.remove(item);
    Api.deleteBackPack(item);
    notifyListeners();
  }

  void updateItem(BackPackItem item) {
    _items[_items.indexWhere((element) => element.itemID == item.itemID)] =
        item;
    Api.updateBackPack(item);
    notifyListeners();
  }
}

final backPackProvider =
    ChangeNotifierProvider.autoDispose<BackPackProvider>((ref) {
  final user = ref.watch(userProvider);
  return BackPackProvider(user);
});
