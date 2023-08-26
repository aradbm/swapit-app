import 'package:flutter/material.dart';
import 'package:swapit_app/services/api.dart';

class AddBackPackItem extends StatefulWidget {
  const AddBackPackItem({super.key});

  @override
  State<AddBackPackItem> createState() => _AddBackPackItemState();
}

class _AddBackPackItemState extends State<AddBackPackItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a random backpack item'),
      ),
      // body: const ImagePick(),
      body: IconButton(
        icon: const Icon(Icons.add),
        onPressed: () async {
          var response = await Api.getUser("1");
          print(response.body);
        },
      ),
    );
  }
}
