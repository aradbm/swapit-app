import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swapit_app/providers/user_provider.dart';

class AddBackPackItem extends ConsumerStatefulWidget {
  const AddBackPackItem({super.key});

  @override
  ConsumerState<AddBackPackItem> createState() => _AddBackPackItemState();
}

class _AddBackPackItemState extends ConsumerState<AddBackPackItem> {
  var providerText = "Provider Text";
  @override
  Widget build(BuildContext context) {
    final user1 = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a random backpack item'),
      ),
      // body: const ImagePick(),
      body: Center(
        child: Column(
          children: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () async {
                // var response = await Api.getUser("1");
                // setState(() {
                //   providerText = response.body.toString();
                // });
              },
            ),
            Text(user1.toString()),
          ],
        ),
      ),
    );
  }
}
