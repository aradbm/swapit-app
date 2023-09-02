import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swapit_app/components/category_picker.dart';
import 'package:swapit_app/models/backpack_item.dart';
import 'package:swapit_app/models/category.dart';
import 'package:swapit_app/providers/backpack_provider.dart';
import 'package:swapit_app/screens/profile_screen/backpack_screen/componenets/backpack_tile.dart';

class BackPackScrreen extends ConsumerStatefulWidget {
  const BackPackScrreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BackPackScrreenState();
}

class _BackPackScrreenState extends ConsumerState<BackPackScrreen> {
  void _onChanged(ItemCategory? value) {
    setState(() {
      _category = value;
    });
  }

  List<BackPackItem> ls = [];
  ItemCategory? _category;
  @override
  Widget build(BuildContext context) {
    List<BackPackItem> backpack = ref.watch(backPackProvider).items;

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        children: [
          CategoryPicker(onChanged: _onChanged),
          const SizedBox(height: 10),
          _category == null
              ? const SizedBox()
              : Text(
                  'Selected Category: ${_category!.name}',
                  style: const TextStyle(fontSize: 20),
                ),
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
                for (var item in backpack) BackPackTile(item: item),
              ],
            ),
          ),
          Text('Total Items: ${ls.length}',
              style: const TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
