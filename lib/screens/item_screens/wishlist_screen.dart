import 'package:flutter/material.dart';
import 'package:swapit_app/data/user1_wl.dart';
import 'package:swapit_app/models/wl_item.dart';

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
          ...ls.map(
            (e) => Padding(
              padding: const EdgeInsets.all(1.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: e.color,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Image.file(e.image, height: 100, width: 100),
                    Text(e.userID),
                    Text(e.category),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
