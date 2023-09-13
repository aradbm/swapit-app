import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swapit_app/models/backpack_item.dart';
import 'package:swapit_app/models/swap_card.dart';
import 'package:swapit_app/providers/user_provider.dart';

import '../services/api.dart';

class SwapCardsProvider extends ChangeNotifier {
  final List<SwapCard> _swapCards = [];
  final List<BackPackItem?> _backPackItems = [];
  String userUID = '';

  List<SwapCard> get swapCards => _swapCards;
  List<BackPackItem?> get backPackItems => _backPackItems;

  Future<void> fetchSwapCards() async {
    _swapCards.clear();
    _swapCards.addAll(await Api.getSwapCards(userUID));

    await fetchBackPackItems();
    notifyListeners();
  }

  Future<void> fetchBackPackItems() async {
    Future<BackPackItem?> getCardBPItem(SwapCard card) async {
      return await Api.getSpecificBackPackItem(
        userUID == card.uidH1
            ? card.bpItem2.toString()
            : card.bpItem1.toString(),
      );
    }

    _backPackItems.clear();
    List<Future<BackPackItem?>> futures =
        _swapCards.map(getCardBPItem).toList();
    _backPackItems.addAll(await Future.wait(futures));

    notifyListeners();
  }

  SwapCardsProvider(String id) {
    userUID = id;
    fetchSwapCards();
  }
}

final swapCardsProvider = ChangeNotifierProvider<SwapCardsProvider>((ref) {
  return SwapCardsProvider(ref.read(userProvider).requireValue.uid);
});
