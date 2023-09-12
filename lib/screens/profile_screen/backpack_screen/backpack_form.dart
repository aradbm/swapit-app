import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swapit_app/components/dropdown_menu.dart';
import 'package:swapit_app/components/pickers/color_picker.dart';
import 'package:swapit_app/models/backpack_item.dart';
import 'package:swapit_app/providers/user_provider.dart';
import '../../../models/category.dart';
import '../../../models/user.dart';
import '../../../providers/backpack_provider.dart';
import '../../../components/text_form_container.dart';
import '../../../providers/categories_provider.dart';
import '../../../utilities/constants.dart';

class EditBackPackItem extends ConsumerStatefulWidget {
  const EditBackPackItem({this.item, super.key});
  final BackPackItem? item;
  @override
  ConsumerState<EditBackPackItem> createState() => _AddBackPackItemState();
}

class _AddBackPackItemState extends ConsumerState<EditBackPackItem> {
  final _formKey = GlobalKey<FormState>();
  final _itemTitleController = TextEditingController();
  final _itemColorController = TextEditingController();
  final _itemPriceConroller = TextEditingController();
  final _itemOriginalPriceController = TextEditingController();
  final _itemDescriptionController = TextEditingController();
  final _itemCategoryController = TextEditingController();
  final _itemSizeController = TextEditingController();
  Color? selectedColor;

  @override
  void initState() {
    super.initState();
    if (widget.item != null) {
      _itemTitleController.text = widget.item!.title;
      _itemColorController.text = widget.item!.color.toString();
      _itemPriceConroller.text = widget.item!.price.toString();
      _itemOriginalPriceController.text = widget.item!.originalprice.toString();
      _itemDescriptionController.text = widget.item!.description ?? '';
      _itemCategoryController.text =
          widget.item!.categoryid.toString(); // to fix
      _itemSizeController.text = widget.item!.size ?? 'None';
      selectedColor = widget.item!.color;
    }
  }

  @override
  Widget build(BuildContext context) {
    // providers
    final backpackProvider = ref.watch(backPackProvider);
    final AsyncValue<List<ItemCategory>> categories =
        ref.watch(categoriesProvider);
    final AsyncValue<AppUser> user = ref.watch(userProvider);

    void addRandomItem() {
      final item = BackPackItem(
        itemid: widget.item?.itemid ?? -1,
        uid: user.when(
          data: (user) => user.uid,
          loading: () => '',
          error: (err, stack) => '',
        ),
        title: 'Random Item',
        color: BackPackItem.getRandomColor(),
        price: 7,
        originalprice: 100,
        categoryid: 12,
        description: 'Random Description',
        size: 'Small',
      );
      backpackProvider.addItem(item);
      Navigator.pop(context);
    }

    // add or edit item function
    void updateOrAddItem() {
      if (_formKey.currentState!.validate()) {
        final item = BackPackItem(
          itemid: widget.item?.itemid ?? -1,
          uid: user.when(
            data: (user) => user.uid,
            loading: () => '',
            error: (err, stack) => '',
          ),
          title: _itemTitleController.text,
          color: selectedColor ??
              widget.item?.color ??
              BackPackItem.getRandomColor(),
          price: int.parse(_itemPriceConroller.text),
          originalprice: int.parse(_itemOriginalPriceController.text),
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
          description: _itemDescriptionController.text,
          size: _itemSizeController.text == ''
              ? 'small'
              : _itemSizeController.text,
        );

        if (item.uid == '') {
          return;
        }

        // add or update item in backpack
        if (widget.item == null) {
          ref.read(backPackProvider).addItem(item);
        } else {
          ref.read(backPackProvider).updateItem(item);
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
            duration: Duration(seconds: 1),
          ),
        );
      }
    }

    // function to change the color
    void changeColor(Color color) {
      setState(() {
        selectedColor = color;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add or Edit Backpack item'),
        actions: [
          // if editing, show delete button
          if (widget.item != null)
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
              TextFormContainer(
                  itemNameController: _itemPriceConroller, title: 'Item Price'),
              TextFormContainer(
                itemNameController: _itemOriginalPriceController,
                title: 'Item Original Price',
              ),
              TextFormContainer(
                itemNameController: _itemDescriptionController,
                title: 'Item Description',
              ),
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
              const SizedBox(height: 8),
              ItemsPicker(
                items: itemSizeValues,
                onChanged: (value) {
                  _itemSizeController.text = value.toString();
                },
                item: widget.item == null ? null : widget.item!.size,
              ),
              const SizedBox(height: 8),
              ColorPicker(
                  selectedColor: selectedColor, onColorChanged: changeColor),
              const SizedBox(height: 8),
              FilledButton(
                onPressed: updateOrAddItem,
                child: Text(widget.item == null ? 'Add Item' : 'Edit Item'),
              ),
              // add random item button, not elevated button
              FilledButton(
                  onPressed: addRandomItem,
                  child: const Text('Add Random Item')),
            ],
          ),
        ),
      ),
    );
  }
}
