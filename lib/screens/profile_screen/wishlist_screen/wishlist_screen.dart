import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swapit_app/models/wishlist_item.dart';

import '../../../providers/wishlist_provider.dart';
import 'components/wishlist_tile.dart';

class WishListScrreen extends ConsumerStatefulWidget {
  const WishListScrreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WishListScrreenState();
}

class _WishListScrreenState extends ConsumerState<WishListScrreen> {
  @override
  Widget build(BuildContext context) {
    List<WishListItem> wishlist = ref.watch(wishListProvider).wishList;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          for (var item in wishlist) WishListTile(item: item),
        ],
      ),
    );
  }
}
