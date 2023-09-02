import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swapit_app/models/backpack_item.dart';
import 'package:swapit_app/providers/user_provider.dart';
import '../../../components/category_picker.dart';
import '../../../models/user.dart';
import '../../../providers/backpack_provider.dart';
import '../../../components/text_form_container.dart';

class AddBackPackItem extends ConsumerStatefulWidget {
  const AddBackPackItem({this.item, super.key});
  final BackPackItem? item;
  @override
  ConsumerState<AddBackPackItem> createState() => _AddBackPackItemState();
}

enum Sized { small, medium, large, xlarge, none }

class _AddBackPackItemState extends ConsumerState<AddBackPackItem> {
  // final int itemID;
  // final String userID;
  // final String title;
  // final Color color;
  // final int? price;
  // final int? originalPrice;
  // final int category;
  // final String? description;
  // final String? location;
  // final String? size;

  final _formKey = GlobalKey<FormState>();
  final _itemTitleController = TextEditingController();
  final _itemColorController = TextEditingController();
  final _itemPriceConroller = TextEditingController();
  final _itemOriginalPriceController = TextEditingController();
  final _itemDescriptionController = TextEditingController();
  final _itemCategoryController = TextEditingController();
  final _itemSizeController = TextEditingController();

  final _itemSizeValues = <String>[
    'None',
    'Small',
    'Medium',
    'Large',
    'X-Large'
  ];

  @override
  void initState() {
    super.initState();
    if (widget.item != null) {
      _itemTitleController.text = widget.item!.title;
      _itemColorController.text = widget.item!.color.toString();
      _itemPriceConroller.text = widget.item!.price.toString();
      _itemOriginalPriceController.text =
          widget.item?.originalPrice.toString() ?? '';
      _itemDescriptionController.text = widget.item!.description ?? '';
      _itemCategoryController.text = widget.item!.category.toString();
      _itemSizeController.text = widget.item!.size ?? 'none';
    }
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<AppUser> user = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add or Edit Backpack item'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(backPackProvider).removeItem(widget.item!);
              Navigator.pop(context);
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormContainer(
                  itemNameController: _itemTitleController,
                  title: 'Item Title'),
              // TextFormContainer(
              //     itemNameController: _itemColorController,
              //     title: 'Item Color'),
              TextFormContainer(
                  itemNameController: _itemPriceConroller, title: 'Item Price'),
              TextFormContainer(
                  itemNameController: _itemOriginalPriceController,
                  title: 'Item Original Price'),
              TextFormContainer(
                  itemNameController: _itemDescriptionController,
                  title: 'Item Description'),
              CategoryPicker(onChanged: (value) {
                setState(() {
                  _itemCategoryController.text = value!.categoryID.toString();
                });
              }),
              DropdownButtonFormField(
                  icon: const Icon(Icons.arrow_downward),
                  value: _itemSizeValues.first,
                  items: _itemSizeValues.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    _itemSizeController.text = value.toString();
                  }),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final item = BackPackItem(
                      itemID: widget.item?.itemID ?? 0,
                      userID: user.when(
                        data: (user) => user.uid,
                        loading: () => '',
                        error: (err, stack) => '',
                      ),
                      title: _itemTitleController.text,
                      color: BackPackItem.getRandomColor(),
                      price: int.parse(_itemPriceConroller.text),
                      originalPrice:
                          int.parse(_itemOriginalPriceController.text),
                      category: int.parse(_itemCategoryController.text),
                      description: _itemDescriptionController.text,
                      size: _itemSizeController.text,
                      location: 'none',
                    );
                    ref.read(backPackProvider).addItem(item);
                    Navigator.pop(context);
                  }
                },
                child: const Text('Save'),
              ),
              // add random item button, not elevated button
              FilledButton(
                onPressed: () {
                  final item = BackPackItem(
                    itemID: widget.item?.itemID ?? 0,
                    userID: user.when(
                      data: (user) => user.uid,
                      loading: () => '',
                      error: (err, stack) => '',
                    ),
                    title: 'Random Item',
                    color: BackPackItem.getRandomColor(),
                    price: 0,
                    originalPrice: 0,
                    category: 12,
                    description: 'Random Description',
                    size: 'none',
                    location: 'none',
                  );
                  ref.read(backPackProvider).addItem(item);
                  Navigator.pop(context);
                },
                child: const Text('Add Random Item'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
