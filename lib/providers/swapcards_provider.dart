import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swapit_app/models/backpack_item.dart';
import 'package:swapit_app/models/swap_card.dart';
import 'package:swapit_app/models/user.dart';
import 'package:swapit_app/providers/user_provider.dart';

import '../services/api.dart';

class SwapCardsProvider extends ChangeNotifier {
  final List<SwapCard> _swapCards = [];
  final List<BackPackItem?> _backPackItems = [];
  final AsyncValue<AppUser> _userAsyncValue;

  List<SwapCard> get swapCards => _swapCards;
  List<BackPackItem?> get backPackItems => _backPackItems;

  SwapCardsProvider(this._userAsyncValue) {
    _userAsyncValue.when(
      data: (user) {
        fetchSwapCards(user.uid);
      },
      loading: () {},
      error: (err, stack) {},
    );
  }

  Future<void> fetchSwapCards(String id) async {
    _swapCards.clear();
    _swapCards.addAll(await Api.getSwapCards(id));

    await fetchBackPackItems();
    notifyListeners();
  }

  Future<void> fetchBackPackItems() async {
    Future<BackPackItem?> getCardBPItem(SwapCard card) async {
      final uid = _userAsyncValue.when(
        data: (user) => user.uid,
        loading: () => '',
        error: (err, stack) => '',
      );
      return await Api.getSpecificBackPackItem(
        uid == card.uidH1 ? card.bpItem2.toString() : card.bpItem1.toString(),
      );
    }

    _backPackItems.clear();
    List<Future<BackPackItem?>> futures =
        _swapCards.map(getCardBPItem).toList();
    _backPackItems.addAll(await Future.wait(futures));

    notifyListeners();
  }
}

final swapCardsProvider = ChangeNotifierProvider<SwapCardsProvider>((ref) {
  final user = ref.watch(userProvider);
  return SwapCardsProvider(user);
});
