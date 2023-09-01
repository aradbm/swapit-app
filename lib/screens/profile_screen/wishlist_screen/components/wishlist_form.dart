import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swapit_app/components/category_picker.dart';
import '../../../../models/wishlist_item.dart';
import '../../../../providers/wishlist_provider.dart';
import '../text_form_container.dart';

class EditWishList extends ConsumerStatefulWidget {
  const EditWishList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WishListFormState();
}

class _WishListFormState extends ConsumerState<EditWishList> {
  final _formKey = GlobalKey<FormState>();
  final _itemNameController = TextEditingController();
  final _itemDescriptionController = TextEditingController();
  final _itemCategoryController = TextEditingController();
  final _itemSizeController = TextEditingController();
  final _itemMinPriceController = TextEditingController();
  final _itemMaxPriceController = TextEditingController();
  final _itemSizeValues = <String>['Small', 'Medium', 'Large', 'X-Large'];

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = ref.watch(wishListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add or edit Wish List Item'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormContainer(
                  itemNameController: _itemNameController, title: 'Item Name'),
              TextFormContainer(
                  itemNameController: _itemDescriptionController,
                  title: 'Item Description'),
              CategoryPicker(onChanged:
                  // _onChanged
                  (value) {
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
              Row(
                children: [
                  Flexible(
                    child: TextFormField(
                      controller: _itemMinPriceController,
                      decoration: const InputDecoration(
                        labelText: 'Min Price',
                        hintText: 'Enter Min Price here',
                        icon: Icon(Icons.money),
                      ),
                      style: const TextStyle(fontSize: 20),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please a price';
                        }
                        if (double.tryParse(value) == null ||
                            double.tryParse(value)! < 0) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                    ),
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: _itemMaxPriceController,
                      decoration: const InputDecoration(
                        labelText: 'Max Price',
                        hintText: 'Enter Max Price here',
                        icon: Icon(Icons.money),
                      ),
                      style: const TextStyle(fontSize: 20),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please a price';
                        }
                        if (double.tryParse(value) == null ||
                            double.tryParse(value)! < 0) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final item = WishListItem(
                      itemID: "item${wishlistProvider.wishList.length + 1}",
                      userID: "user1",
                      color: Colors.red,
                      categoryID: _itemCategoryController.text,
                      size: _itemSizeController.text == ''
                          ? 'small'
                          : _itemSizeController.text,
                      minPrice: int.parse(_itemMinPriceController.text),
                      maxPrice: int.parse(_itemMaxPriceController.text),
                      description: _itemDescriptionController.text,
                    );

                    wishlistProvider.addItem(item);
                    // clear text fields and pop screen
                    _itemNameController.clear();
                    _itemDescriptionController.clear();
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please fill in all fields'),
                      ),
                    );
                  }
                },
                child: const Text('add sample item'),
              ),
              ElevatedButton(
                onPressed: () {
                  final provider = ref.watch(wishListProvider);
                  provider.removeItem(provider.wishList.first);
                  Navigator.pop(context);
                },
                child: const Text('Remove first item for fun'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
