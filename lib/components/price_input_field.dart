import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class PriceInput extends StatelessWidget {
  const PriceInput({
    super.key,
    required TextEditingController itemMinPriceController,
    required this.title,
  }) : _itemMinPriceController = itemMinPriceController;

  final TextEditingController _itemMinPriceController;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        height: containerHeight,
        padding: const EdgeInsets.symmetric(horizontal: padding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: TextFormField(
          controller: _itemMinPriceController,
          decoration: InputDecoration(
            labelText: title,
            icon: Icon(
              Icons.money,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
          style: const TextStyle(
            fontSize: fontSize,
          ),
          textInputAction: TextInputAction.next,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please a price';
            }
            if (double.tryParse(value) == null || double.tryParse(value)! < 0) {
              return 'Please enter a valid number';
            }
            return null;
          },
        ),
      ),
    );
  }
}
