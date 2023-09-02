import 'package:flutter/material.dart';
import 'package:swapit_app/screens/profile_screen/backpack_screen/backpack_form.dart';
import 'package:swapit_app/screens/profile_screen/wishlist_screen/wishlist_form.dart';
import 'package:swapit_app/screens/profile_screen/wishlist_screen/wishlist_screen.dart';
import 'backpack_screen/backpack_screen.dart';

class MyItemsScreen extends StatefulWidget {
  const MyItemsScreen({super.key});
  @override
  State<MyItemsScreen> createState() => _MyItemsScreenState();
}

final List<Tab> myTabs = <Tab>[
  const Tab(text: 'BackPack', icon: Icon(Icons.backpack)),
  const Tab(text: 'WishList', icon: Icon(Icons.list_alt)),
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
              heroTag: 'backpack',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddBackPackItem(),
                  ),
                );
              },
              backgroundColor: Colors.purpleAccent,
              child: const Icon(Icons.add, size: 40, color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            FloatingActionButton(
              heroTag: 'wishlist',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditWishList(),
                  ),
                );
              },
              backgroundColor: Colors.pinkAccent,
              child: const Icon(Icons.add_shopping_cart_sharp,
                  size: 40, color: Colors.white),
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
