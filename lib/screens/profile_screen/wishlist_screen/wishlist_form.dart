import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swapit_app/components/category_picker.dart';
import '../../../models/user.dart';
import '../../../models/wishlist_item.dart';
import '../../../providers/user_provider.dart';
import '../../../providers/wishlist_provider.dart';
import 'components/text_form_container.dart';

class EditWishList extends ConsumerStatefulWidget {
  const EditWishList({super.key, this.item});

  final WishListItem? item;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WishListFormState();
}

enum Sized { small, medium, large, xlarge, none }

class _WishListFormState extends ConsumerState<EditWishList> {
  final _formKey = GlobalKey<FormState>();
  final _itemDescriptionController = TextEditingController();
  final _itemCategoryController = TextEditingController();
  final _itemSizeController = TextEditingController();
  final _itemMinPriceController = TextEditingController();
  final _itemMaxPriceController = TextEditingController();
  final _itemSizeValues = <String>['Small', 'Medium', 'Large', 'X-Large'];

  @override
  void initState() {
    super.initState();
    if (widget.item != null) {
      _itemDescriptionController.text = widget.item!.description ?? '';
      _itemCategoryController.text = widget.item!.categoryID.toString();
      _itemSizeController.text = widget.item!.size ?? 'none';
      _itemMinPriceController.text = widget.item!.minPrice.toString();
      _itemMaxPriceController.text = widget.item!.maxPrice.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = ref.watch(wishListProvider);
    final AsyncValue<AppUser> user = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add or Edit Wish List Item'),
        actions: [
          IconButton(
            onPressed: () {
              wishlistProvider.removeItem(widget.item!);
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
                      itemID: widget.item?.itemID ?? 0,
                      userID: user.when(
                        data: (user) => user.uid,
                        loading: () => '',
                        error: (error, stackTrace) => '',
                      ),
                      color: Colors.red,
                      categoryID: int.parse(_itemCategoryController.text),
                      size: _itemSizeController.text == ''
                          ? 'small'
                          : _itemSizeController.text,
                      minPrice: int.parse(_itemMinPriceController.text),
                      maxPrice: int.parse(_itemMaxPriceController.text),
                      description: _itemDescriptionController.text,
                    );

                    if (item.userID == '') {
                      return;
                      // pop snackbar
                    }

                    // check if its an edit or add first time
                    if (widget.item != null) {
                      wishlistProvider.updateItem(item);
                    } else {
                      wishlistProvider.addItem(item);
                    }
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please fill in all fields'),
                      ),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
