import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swapit_app/models/wishlist_item.dart';
import 'package:swapit_app/providers/user_provider.dart';

import '../../../providers/wishlist_provider.dart';
import 'components/wishlist_tile.dart';

class WishListScrreen extends ConsumerWidget {
  const WishListScrreen({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final List<WishListItem> wishlist = ref.watch(wishListProvider).wishList;
    final user = ref.watch(userProvider);
    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(wishListProvider.notifier).fetchWishList(
              user.when(
                data: (user) => user.uid,
                loading: () => '',
                error: (err, stack) => '',
              ),
            );
      },
      child: ListView(
        children: [
          for (var item in wishlist) WishListTile(item: item),
        ],
      ),
    );
  }
}
