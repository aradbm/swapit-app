import 'package:flutter/material.dart';

class TextFormContainer extends StatelessWidget {
  const TextFormContainer({
    super.key,
    required TextEditingController itemNameController,
    required String title,
  })  : _itemNameController = itemNameController,
        _title = title;

  final TextEditingController _itemNameController;
  final String _title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: _itemNameController,
        decoration: InputDecoration(
          labelText: _title,
          hintText: 'Enter $_title here',
          icon: const Icon(Icons.shopping_bag),
        ),
        style: const TextStyle(fontSize: 20),
        textInputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $_title';
          }
          return null;
        },
      ),
    );
  }
}
