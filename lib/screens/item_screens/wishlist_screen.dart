import 'package:flutter/material.dart';
import 'package:swapit_app/data/user1_wl.dart';
import 'package:swapit_app/models/wl_item.dart';
import 'package:swapit_app/widgets/wishlist_tile.dart';

class WishListScrreen extends StatefulWidget {
  const WishListScrreen({super.key});

  @override
  State<WishListScrreen> createState() => _WishListScrreenState();
}

class _WishListScrreenState extends State<WishListScrreen> {
  List<WishListItem> ls = dummyWishlistItems;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          ...ls.map((e) => WishListTile(item: e)),
          ...ls.map((e) => WishListTile(item: e)),
          ...ls.map((e) => WishListTile(item: e)),
        ],
      ),
    );
  }
}
