import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swapit_app/models/backpack_item.dart';
import 'package:swapit_app/screens/swap_screens/card.dart';
import '../../models/swap_card.dart';
import '../../providers/swapcards_provider.dart';
import '../../services/api.dart';

class ItemsSwap extends ConsumerWidget {
  const ItemsSwap({super.key});

  Future<BackPackItem?> getCardBPItem(SwapCard card) async {
    return await Api.getSpecificBackPackItem(card.getBpItem1.toString());
  }

  @override
  Widget build(BuildContext context, ref) {
    final swapCards = ref.watch(swapCardsProvider).swapCards;
    final backPackItems = ref.watch(swapCardsProvider).backPackItems;

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: RefreshIndicator(
        onRefresh: () async {
          ref.watch(swapCardsProvider).fetchSwapCards();
        },
        child: AppinioSwiper(
          swipeOptions: const AppinioSwipeOptions.only(
            top: false,
            bottom: false,
            left: true,
            right: true,
          ),
          backgroundCardsCount: 1,
          cardsCount: swapCards.length,
          onSwiping: (AppinioSwiperDirection direction) {
            // print(direction.index); // 1 - left, 2 - right
            if (direction.index == 1) {
              // left - call api to update the swapcard to false
              // ref.read(swapCardsProvider).rejectSwapCard(swapCards[0]);
            } else if (direction.index == 2) {
              // right
              // ref.read(swapCardsProvider).acceptSwapCard(swapCards[0]);
            }
          },
          onEnd: () {
            ref.read(swapCardsProvider).fetchSwapCards();
          },
          cardsBuilder: (BuildContext context, int index) {
            return SwapCardUI(
              card: swapCards[index],
              bpItem: backPackItems[index],
            );
          },
        ),
      ),
    );
  }
}
