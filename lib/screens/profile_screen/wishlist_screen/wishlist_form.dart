import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swapit_app/components/category_picker.dart';
import '../../../models/user.dart';
import '../../../models/wishlist_item.dart';
import '../../../providers/user_provider.dart';
import '../../../providers/wishlist_provider.dart';
import '../../../components/text_form_container.dart';

class EditWishList extends ConsumerStatefulWidget {
  const EditWishList({super.key, this.item});
  final WishListItem? item;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WishListFormState();
}

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
      _itemCategoryController.text = widget.item!.categoryid.toString();
      _itemSizeController.text = widget.item!.size ?? 'none';
      _itemMinPriceController.text = widget.item!.minprice.toString();
      _itemMaxPriceController.text = widget.item!.maxprice.toString();
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
                  _itemCategoryController.text = value!.categoryid.toString();
                });
              }),
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: DropdownButtonFormField(
                    iconSize: 36,
                    elevation: 16,
                    menuMaxHeight: 300,
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                    icon: const Icon(Icons.arrow_drop_down),
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
              ),
              Row(
                children: [
                  Flexible(
                    child: Container(
                      height: 70,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 144, 144),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextFormField(
                        controller: _itemMinPriceController,
                        decoration: const InputDecoration(
                          labelText: 'Min Price',
                          hintText: 'Enter Min Price here',
                          icon: Icon(Icons.money),
                        ),
                        style: const TextStyle(fontSize: 15),
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
                  ),
                  Flexible(
                    child: Container(
                      height: 70,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 144, 144),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextFormField(
                        controller: _itemMaxPriceController,
                        decoration: const InputDecoration(
                          labelText: 'Max Price',
                          hintText: 'Enter Max Price here',
                          icon: Icon(Icons.money),
                        ),
                        style: const TextStyle(fontSize: 15),
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
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final item = WishListItem(
                      itemid: widget.item?.itemid ?? 0,
                      uid: user.when(
                        data: (user) => user.uid,
                        loading: () => '',
                        error: (error, stackTrace) => '',
                      ),
                      color: Colors.red,
                      categoryid: int.parse(_itemCategoryController.text),
                      size: _itemSizeController.text == ''
                          ? 'small'
                          : _itemSizeController.text,
                      minprice: int.parse(_itemMinPriceController.text),
                      maxprice: int.parse(_itemMaxPriceController.text),
                      description: _itemDescriptionController.text,
                    );

                    if (item.uid == '') {
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
              // add random item button, not elevated button
              FilledButton(
                onPressed: () {
                  final item = WishListItem(
                    itemid: widget.item?.itemid ??
                        wishlistProvider.wishList.length + 1,
                    uid: user.when(
                      data: (user) => user.uid,
                      loading: () => '',
                      error: (err, stack) => '',
                    ),
                    categoryid: 1,
                    color: WishListItem.getRandomColor(),
                    size: 'none',
                    minprice: 0,
                    maxprice: 0,
                    description: 'Random Description',
                  );
                  wishlistProvider.addItem(item);
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
