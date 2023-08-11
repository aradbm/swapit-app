import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePick extends StatefulWidget {
  const ImagePick({Key? key}) : super(key: key);

  @override
  State<ImagePick> createState() => _ImagePickState();
}

class _ImagePickState extends State<ImagePick> {
  // This is the file that will be used to store the image
  File? _image;

  // This is the image picker
  final _picker = ImagePicker();
  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final XFile? pickedImage = await _picker.pickImage(
        source: ImageSource.camera, imageQuality: 50, maxWidth: 400);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(35),
        child: Column(children: [
          Center(
            // this button is used to open the image picker
            child: ElevatedButton(
              onPressed: _openImagePicker,
              child: const Text('Select An Image'),
            ),
          ),
          const SizedBox(height: 35),
          // The picked image will be displayed here
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 300,
            color: Colors.grey[300],
            child: _image != null
                ? Image.file(_image!, fit: BoxFit.cover)
                : const Text('Please select an image'),
          )
        ]),
      ),
    );
  }
}
