import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swapit_app/models/category.dart';

import '../../../providers/categories_provider.dart';
import 'single_category_picker.dart';

class CategoryPicker extends ConsumerStatefulWidget {
  const CategoryPicker({super.key, required this.onChanged});

  final Function(ItemCategory?) onChanged;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Cpall();
}

class _Cpall extends ConsumerState<CategoryPicker> {
  void _onC1Changed(ItemCategory? value) {
    setState(() {
      _category2 = null;
      _category3 = null;
      _category = value;
    });

    _mainValueChange(value);
  }

  void _onC2Changed(ItemCategory? value) {
    setState(() {
      _category3 = null;
      _category2 = value;
    });

    _mainValueChange(value);
  }

  void _onC3Changed(ItemCategory? value) {
    setState(() {
      _category3 = value;
    });

    _mainValueChange(value);
  }

  void _mainValueChange(ItemCategory? value) {
    widget.onChanged(value);
  }

  ItemCategory? _category;
  ItemCategory? _category2;
  // ignore: unused_field
  ItemCategory? _category3;
  @override
  Widget build(BuildContext context) {
    AsyncValue<List<ItemCategory>> categories = ref.watch(categoriesProvider);

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          SingleCategoriesPicker(
              categories: categories, onChanged: _onC1Changed),
          const SizedBox(height: 10),
          if (_category != null)
            SingleCategoriesPicker(
                categories: categories,
                onChanged: _onC2Changed,
                parentID: _category!.categoryID),
          const SizedBox(height: 10),
          if (_category2 != null &&
              categories.when(
                      data: (value) => value
                          .where((element) =>
                              element.parentID == _category2!.categoryID)
                          .isNotEmpty,
                      loading: () => false,
                      error: (_, __) => false) ==
                  true)
            SingleCategoriesPicker(
                categories: categories,
                onChanged: _onC3Changed,
                parentID: _category2!.categoryID),
        ],
      ),
    );
  }
}
