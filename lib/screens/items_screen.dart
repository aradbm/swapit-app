import 'package:flutter/material.dart';
import 'package:swapit_app/screens/backpack_screen.dart';
import 'package:swapit_app/screens/wishlist_screen.dart';

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
        appBar: TabBar(
          tabs: myTabs,
        ),
        body: const TabBarView(children: [
          BackPackScrreen(),
          WishListScrreen(),
        ]
            // myTabs.map((Tab tab) {
            //   final String? label = tab.text?.toLowerCase();
            //   return Center(
            //     child: Text(
            //       'This is the $label tab',
            //       style: const TextStyle(fontSize: 36),
            //     ),
            //   );
            // }).toList(),
            ),
      ),
    );
  }
}
