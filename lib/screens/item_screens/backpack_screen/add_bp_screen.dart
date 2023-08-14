import 'package:flutter/material.dart';

import 'image_picker.dart';

class AddBackPackItem extends StatelessWidget {
  const AddBackPackItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Back PackItem'),
      ),
      body: const ImagePick(),
    );
  }
}
