import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swapit_app/models/backpack_item.dart';
import 'package:swapit_app/providers/backpack_provider.dart';
import 'package:swapit_app/providers/user_provider.dart';
import 'package:swapit_app/screens/profile_screen/backpack_screen/componenets/backpack_tile.dart';

class BackPackScreen extends ConsumerWidget {
  const BackPackScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    List<BackPackItem> backpack = ref.watch(backPackProvider).items;
    final user = ref.watch(userProvider);
    return RefreshIndicator(
      onRefresh: () async {
        ref.read(backPackProvider).fetchBackPack(
              user.when(
                data: (user) => user.uid,
                loading: () => '',
                error: (err, stack) => '',
              ),
            );
      },
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Expanded(
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                children: [
                  for (var item in backpack) BackPackTile(item: item),
                ],
              ),
            ),
            Text('Total Items: ${backpack.length}',
                style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
