import 'package:flutter/material.dart';

import '../../utilities/constants.dart';

// ignore: must_be_immutable
class ColorPicker extends StatefulWidget {
  Color? selectedColor;
  final Function(Color) onColorChanged;
  ColorPicker({
    super.key,
    this.selectedColor,
    required this.onColorChanged,
  });

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  Future<void> selectColor(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            width: 300,
            height: 500,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: fixedColors.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.selectedColor = fixedColors[index];
                      widget.onColorChanged(fixedColors[index]);
                    });
                    Navigator.pop(context);
                  },
                  child: Container(
                    color: fixedColors[index],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(
            onPressed: () => selectColor(context),
            child: const Text('Select Color',
                style: TextStyle(color: Colors.black))),
        const SizedBox(width: 20),
        Container(
          width: 50,
          height: 50,
          color: widget.selectedColor ?? Colors.transparent,
          alignment: Alignment.center,
          child:
              widget.selectedColor == null ? const Text("pick \ncolor") : null,
        )
      ],
    );
  }
}
