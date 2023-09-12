import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/category.dart';

class SingleCategoriesPicker extends StatefulWidget {
  const SingleCategoriesPicker({
    super.key,
    required this.categories,
    required this.onChanged,
    this.parentID = 0,
  });
  final Function(ItemCategory?) onChanged;
  final int parentID;
  final AsyncValue<List<ItemCategory>> categories;

  @override
  State<SingleCategoriesPicker> createState() => _SingleCategoriesPickerState();
}

class _SingleCategoriesPickerState extends State<SingleCategoriesPicker> {
  ItemCategory? _itemCategory;

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
        value: _itemCategory,
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
        items: widget.categories.when(
          data: (value) {
            return value
                .where((element) => element.parentid == widget.parentID)
                .map(
                  (category) => DropdownMenuItem<ItemCategory>(
                    value: category,
                    child: Text(category.name),
                  ),
                )
                .toList();
          },
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
        onChanged: (ItemCategory? category) {
          widget.onChanged(category);
          // change the value of the selected category

          setState(() {
            _itemCategory = category;
            widget.onChanged(category);
          });
        },
      ),
    );
  }
}
