import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swapit_app/models/swap_card.dart';

import '../services/api.dart';

class SwapCardsProvider extends ChangeNotifier {
  final List<SwapCard> _swapCards = [];

  List<SwapCard> get swapCards => _swapCards;

  void fetchSwapCards(String uid) async {
    _swapCards.clear();
    _swapCards.addAll(await Api.getSwapCards(uid));
    notifyListeners();
  }

  SwapCardsProvider(String id) {
    fetchSwapCards(id);
  }
}

final swapCardsProvider = ChangeNotifierProvider<SwapCardsProvider>((ref) {
  return SwapCardsProvider('user_1');
});
