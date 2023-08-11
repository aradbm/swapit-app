import 'package:flutter/material.dart';
import 'package:swapit_app/screens/item_screens/add_bp_screen.dart';
import 'package:swapit_app/screens/item_screens/add_wl_screen.dart';
import 'package:swapit_app/screens/item_screens/wishlist_screen.dart';

import 'backpack_screen.dart';

class MyItemsScreen extends StatefulWidget {
  const MyItemsScreen({super.key});

  @override
  State<MyItemsScreen> createState() => _MyItemsScreenState();
}

final List<Tab> myTabs = <Tab>[
  const Tab(
    text: 'BackPack',
    icon: Icon(Icons.backpack),
  ),
  const Tab(
    text: 'WishList',
    icon: Icon(Icons.list_alt),
  ),
];

class _MyItemsScreenState extends State<MyItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                // push from bottom to top
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddBackPackItem(),
                  ),
                );
              },
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              height: 3,
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddWishListItem(),
                  ),
                );
              },
              backgroundColor: Colors.transparent,
              child: const Icon(
                Icons.add_shopping_cart_sharp,
                size: 40,
                color: Colors.white,
              ),
            ),
          ],
        ),
        appBar: TabBar(
          tabs: myTabs,
        ),
        body: const TabBarView(
          children: [
            BackPackScrreen(),
            WishListScrreen(),
          ],
        ),
      ),
    );
  }
}
