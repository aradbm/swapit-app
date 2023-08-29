import 'package:flutter/material.dart';
import 'package:swapit_app/screens/item_screens/wishlist_screen/wishlist_form.dart';

class AddWishListItem extends StatelessWidget {
  const AddWishListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Wish List Item'),
      ),
      body: const WishListForm(),
    );
  }
}
