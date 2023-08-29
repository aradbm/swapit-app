import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swapit_app/screens/item_screens/wishlist_screen/wishlist_tile.dart';

import '../../../providers/wishlist_provider.dart';

class WishListScrreen extends ConsumerStatefulWidget {
  const WishListScrreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WishListScrreenState();
}

class _WishListScrreenState extends ConsumerState<WishListScrreen> {
  @override
  Widget build(BuildContext context) {
    var wishlist = ref.watch(wishListProvider).wishList;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          ...wishlist.map((e) => WishListTile(item: e)),
        ],
      ),
    );
  }
}
