import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swapit_app/models/backpack_item.dart';
import 'package:swapit_app/providers/user_provider.dart';
import '../../../models/user.dart';
import '../../../providers/backpack_provider.dart';

class AddBackPackItem extends ConsumerStatefulWidget {
  const AddBackPackItem({this.item, super.key});
  final BackPackItem? item;
  @override
  ConsumerState<AddBackPackItem> createState() => _AddBackPackItemState();
}

class _AddBackPackItemState extends ConsumerState<AddBackPackItem> {
  @override
  Widget build(BuildContext context) {
    final AsyncValue<AppUser> user = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add or Edit Backpack item'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(backPackProvider).removeItem(widget.item!);
              Navigator.pop(context);
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 200,
              width: 300,
              padding: const EdgeInsets.all(10),
              child: user.when(
                data: (user) => Text(user.toString()),
                loading: () => const CircularProgressIndicator(),
                error: (error, stackTrace) => Text(error.toString()),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                if (widget.item != null) {
                  ref.read(backPackProvider).addItem(widget.item!);
                } else {
                  BackPackItem item = BackPackItem(
                    itemID: 1,
                    userID: user.when(
                      data: (user) => user.uid,
                      loading: () => '',
                      error: (error, stackTrace) => '',
                    ),
                    title: 'test',
                    color: Colors.red,
                    price: 1,
                    originalPrice: 1,
                    category: 1,
                    description: 'test',
                    location: 'test',
                    size: 'Large',
                  );
                  ref.read(backPackProvider).addItem(item);
                }
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
