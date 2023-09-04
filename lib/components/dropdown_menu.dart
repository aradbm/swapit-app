import 'package:flutter/material.dart';

class ItemsPicker extends StatefulWidget {
  const ItemsPicker({
    super.key,
    required this.items,
    required this.onChanged,
    this.item,
  });
  final Function(String?) onChanged;
  final List<String> items;
  final String? item;

  @override
  State<ItemsPicker> createState() => _ItemsPickerState();
}

class _ItemsPickerState extends State<ItemsPicker> {
  String? item;

  @override
  void initState() {
    super.initState();
    item = widget.item ?? widget.items[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: DropdownButton<String>(
        value: item,
        isExpanded: true,
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 36,
        elevation: 16,
        menuMaxHeight: 400,
        borderRadius: BorderRadius.circular(20),
        style: const TextStyle(color: Colors.black, fontSize: 18),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        items: widget.items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? value) {
          setState(() {
            item = value;
          });
          widget.onChanged(value);
        },
      ),
    );
  }
}
