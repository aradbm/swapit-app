import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swapit_app/components/dropdown_menu.dart';
import 'package:swapit_app/models/category.dart';
import '../../../components/pickers/color_picker.dart';
import '../../../components/pickers/location_picker.dart';
import '../../../models/user.dart';
import '../../../models/wishlist_item.dart';
import '../../../providers/categories_provider.dart';
import '../../../providers/user_provider.dart';
import '../../../providers/wishlist_provider.dart';
import '../../../components/text_form_container.dart';
import '../../../utilities/constants.dart';
import '../../../components/price_input_field.dart';

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
  final _itemLatituteController = TextEditingController();
  final _itemLongituteController = TextEditingController();
  Color? selectedColor;

  @override
  void initState() {
    super.initState();
    if (widget.item != null) {
      _itemDescriptionController.text = widget.item!.description ?? '';
      _itemCategoryController.text =
          widget.item!.categoryid.toString(); // to fix
      _itemSizeController.text = widget.item!.size ?? 'None';
      _itemMinPriceController.text = widget.item!.minprice.toString();
      _itemMaxPriceController.text = widget.item!.maxprice.toString();
      selectedColor = widget.item!.color;
      _itemLatituteController.text = widget.item!.latitude.toString();
      _itemLongituteController.text = widget.item!.longitude.toString();
    }
  }

  // function to change the color
  void changeColor(Color color) {
    setState(() {
      selectedColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    // providers
    final wishlistProvider = ref.watch(wishListProvider);
    final AsyncValue<AppUser> user = ref.watch(userProvider);
    final AsyncValue<List<ItemCategory>> categories =
        ref.watch(categoriesProvider);

    // add item function
    void addRandomItem() {
      final item = WishListItem(
        itemid: widget.item?.itemid ?? -1,
        uid: user.when(
          data: (user) => user.uid,
          loading: () => '',
          error: (err, stack) => '',
        ),
        categoryid: 2,
        color: WishListItem.getRandomColor(),
        size: 'None',
        minprice: 0,
        maxprice: 0,
        description: 'Random Description',
      );
      wishlistProvider.addItem(item);
      Navigator.pop(context);
    }

    // update or add item function
    void updateOrAddItem() {
      if (_formKey.currentState!.validate()) {
        final item = WishListItem(
          itemid: widget.item?.itemid ?? -1,
          uid: user.when(
            data: (user) => user.uid,
            loading: () => '',
            error: (error, stackTrace) => '',
          ),
          color: selectedColor ??
              widget.item?.color ??
              WishListItem
                  .getRandomColor(), // find in categories list where the name is the same as the text in the controller
          categoryid: categories.when(
            data: (value) => value
                .firstWhere((element) =>
                    element.name == _itemCategoryController.text ||
                    element.categoryid.toString() ==
                        _itemCategoryController.text)
                .categoryid,
            loading: () => 0,
            error: (error, stackTrace) => 0,
          ),
          size: _itemSizeController.text == ''
              ? 'Small'
              : _itemSizeController.text,
          minprice: int.parse(_itemMinPriceController.text),
          maxprice: int.parse(_itemMaxPriceController.text),
          description: _itemDescriptionController.text,
          latitude: double.parse(_itemLatituteController.text),
          longitude: double.parse(_itemLongituteController.text),
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
        // show snackbar if successful
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              widget.item == null ? 'Item Added' : 'Item Edited',
            ),
            duration: const Duration(seconds: 1),
          ),
        );
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please fill in all fields'),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add or Edit Wish List Item'),
        actions: [
          if (widget.item != null)
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
              const SizedBox(height: 10),
              categories.when(
                data: (value) => ItemsPicker(
                  items: value.map((e) => e.name).toList(),
                  onChanged: (value) {
                    _itemCategoryController.text = value.toString();
                  },
                  item: widget.item == null
                      ? null
                      : value
                          .firstWhere((element) =>
                              element.categoryid == widget.item!.categoryid)
                          .name,
                ),
                loading: () => const CircularProgressIndicator(),
                error: (error, stackTrace) => const Text('Error'),
              ),
              const SizedBox(height: 10),
              ItemsPicker(
                items: itemSizeValues,
                onChanged: (value) {
                  _itemSizeController.text = value.toString();
                },
                item: widget.item?.size,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  PriceInput(
                    itemMinPriceController: _itemMinPriceController,
                    title: 'Min Price',
                  ),
                  PriceInput(
                      itemMinPriceController: _itemMaxPriceController,
                      title: 'Max Price'),
                ],
              ),
              const SizedBox(height: 8),
              ColorPicker(
                  selectedColor: selectedColor, onColorChanged: changeColor),
              const SizedBox(height: 10),
              LocationPicker(
                itemLatituteController: _itemLatituteController,
                itemLongituteController: _itemLongituteController,
              ),
              ElevatedButton(
                  onPressed: updateOrAddItem, child: const Text('Submit')),
              FilledButton(
                  onPressed: addRandomItem, child: const Text(' Random Item')),
            ],
          ),
        ),
      ),
    );
  }
}
