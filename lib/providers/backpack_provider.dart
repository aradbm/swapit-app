import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swapit_app/models/backpack_item.dart';
import 'package:swapit_app/providers/user_provider.dart';
import '../models/user.dart';
import '../services/api.dart';

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

  void addItem(BackPackItem item) async {
    int id = await Api.uploadBackPack(item);
    item.itemid = id;
    _items.add(item);
    notifyListeners();
  }

  void removeItem(BackPackItem item) {
    _items.remove(item);
    Api.deleteBackPack(item);
    notifyListeners();
  }

  void updateItem(BackPackItem item) {
    _items[_items.indexWhere((element) => element.itemid == item.itemid)] =
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
