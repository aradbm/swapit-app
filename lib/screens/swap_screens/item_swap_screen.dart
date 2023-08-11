import 'package:flutter/cupertino.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';

class ItemsSwap extends StatefulWidget {
  const ItemsSwap({super.key});

  @override
  State<ItemsSwap> createState() => _ItemsSwapState();
}

class _ItemsSwapState extends State<ItemsSwap> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        child: AppinioSwiper(
          swipeOptions: const AppinioSwipeOptions.only(
            top: false,
            bottom: false,
            left: true,
            right: true,
          ),
          backgroundCardsCount: 1,
          cardsCount: 20,
          onSwiping: (AppinioSwiperDirection direction) {
            print(direction.index); // 1 - left, 2 - right
          },
          cardsBuilder: (BuildContext context, int index) {
            return Container(
              foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.5),
                  ],
                ),
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Theme.of(context).primaryColor,
              ),
              child: Text(index.toString()),
            );
          },
        ),
      ),
    );
  }
}
