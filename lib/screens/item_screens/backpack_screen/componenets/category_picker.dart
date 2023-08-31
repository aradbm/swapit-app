import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/category.dart';

class CategoriesPicker extends StatelessWidget {
  const CategoriesPicker({
    super.key,
    required this.categories,
  });

  final AsyncValue<List<ItemCategory>> categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: DropdownButton<ItemCategory>(
        hint: const Text('Select Category'),
        isExpanded: true,
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 36,
        elevation: 16,
        menuMaxHeight: 300,
        style: const TextStyle(color: Colors.black, fontSize: 18),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        items: categories.when(
          data: (value) => value
              .where((element) =>
                  element.categoryID != 1 && element.categoryID != 2)
              .map(
                (category) => DropdownMenuItem<ItemCategory>(
                  value: category,
                  child: Text(category.name),
                ),
              )
              .toList(),
          loading: () => const [
            DropdownMenuItem<ItemCategory>(
              value: null,
              child: Text('Loading...'),
            ),
          ],
          error: (error, stackTrace) => const [
            DropdownMenuItem<ItemCategory>(
              value: null,
              child: Text('Error'),
            ),
          ],
        ),
        onChanged: (ItemCategory? category) {},
      ),
    );
  }
}
