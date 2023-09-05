import 'package:flutter/material.dart';

class TextFormContainer extends StatelessWidget {
  const TextFormContainer({
    Key? key,
    required this.itemNameController,
    required this.title,
  }) : super(key: key);

  final TextEditingController itemNameController;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.blueGrey[100]!,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextFormField(
        controller: itemNameController,
        decoration: InputDecoration(
          labelText: title,
          hintText: 'Enter $title here',
          icon: const Icon(
            Icons.shopping_bag,
            color: Colors.blueGrey,
          ),
          border: InputBorder.none,
        ),
        style: const TextStyle(fontSize: 18, color: Colors.black),
        textInputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $title';
          }
          return null;
        },
      ),
    );
  }
}
