import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swapit_app/screens/swap_screens/card.dart';
import '../../providers/swapcards_provider.dart';

class ItemsSwap extends ConsumerWidget {
  const ItemsSwap({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final swapCards = ref.watch(swapCardsProvider).swapCards;

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: RefreshIndicator(
        onRefresh: () async {
          ref.read(swapCardsProvider).fetchSwapCards();
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
          },
          cardsBuilder: (BuildContext context, int index) {
            return SwapCardUI(index: index, card: swapCards[index]);
          },
        ),
      ),
    );
  }
}
