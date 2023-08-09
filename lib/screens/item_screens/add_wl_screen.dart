import 'package:flutter/material.dart';

class AddWishListItem extends StatelessWidget {
  const AddWishListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Wish List Item'),
      ),
      body: const Center(
        child: Text('Add Wish List Item'),
      ),
    );
  }
}
