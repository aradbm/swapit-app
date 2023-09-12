import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swapit_app/models/swap_card.dart';
import 'package:swapit_app/providers/user_provider.dart';

import '../services/api.dart';

class SwapCardsProvider extends ChangeNotifier {
  final List<SwapCard> _swapCards = [];
  String userUID = '';

  List<SwapCard> get swapCards => _swapCards;

  void fetchSwapCards() async {
    _swapCards.clear();
    _swapCards.addAll(await Api.getSwapCards(userUID));
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
