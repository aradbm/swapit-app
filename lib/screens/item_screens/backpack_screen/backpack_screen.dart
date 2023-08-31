import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swapit_app/models/backpack_item.dart';
import 'package:swapit_app/data/user1_bp.dart';
import 'package:swapit_app/models/category.dart';
import 'package:swapit_app/screens/item_screens/backpack_screen/componenets/backpack_tile.dart';

import '../../../providers/categories_provider.dart';
import 'componenets/category_picker.dart';

class BackPackScrreen extends ConsumerStatefulWidget {
  const BackPackScrreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BackPackScrreenState();
}

class _BackPackScrreenState extends ConsumerState<BackPackScrreen> {
  List<BackPackItem> ls = dummyBackpackItems;
  @override
  Widget build(BuildContext context) {
    AsyncValue<List<ItemCategory>> categories = ref.watch(categoriesProvider);
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        children: [
          const SizedBox(height: 10),
          CategoriesPicker(categories: categories),
          const SizedBox(height: 10),
          Expanded(
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
          ),
        ],
      ),
    );
  }
}
