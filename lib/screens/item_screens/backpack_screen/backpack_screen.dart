import 'package:flutter/material.dart';
import 'package:swapit_app/models/backpack_item.dart';
import 'package:swapit_app/data/user1_bp.dart';
import 'package:swapit_app/screens/item_screens/backpack_screen/backpack_tile.dart';

class BackPackScrreen extends StatefulWidget {
  const BackPackScrreen({super.key});

  @override
  State<BackPackScrreen> createState() => _BackPackScrreenState();
}

class _BackPackScrreenState extends State<BackPackScrreen> {
  List<BackPackItem> ls = dummyBackpackItems;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children: [
          ...ls.map((e) => BackPackTile(item: e)),
        ],
      ),
    );
  }
}
