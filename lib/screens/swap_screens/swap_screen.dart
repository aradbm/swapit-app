import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swapit_app/providers/user_provider.dart';
import 'package:swapit_app/screens/swap_screens/item_swap_screen.dart';

import '../../providers/swapcards_provider.dart';

class SwapScreen extends ConsumerWidget {
  const SwapScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final user = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Swap Screen'),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(swapCardsProvider).fetchSwapCards(user.when(
                    data: (user) => user.uid,
                    loading: () => '',
                    error: (err, stack) => ''));
              },
              icon: const Icon(Icons.refresh, size: 30)),
          const Icon(Icons.settings, size: 30),
        ],
      ),
      body: Column(
        children: [
          const ItemsSwap(),
          Row(
            // tinder like buttons
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.close, size: 50),
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.red),
                  fixedSize: WidgetStateProperty.all(const Size(75, 75)),
                ),
              ),
              IconButton(
                  icon: const Icon(Icons.favorite, size: 50),
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.green),
                    fixedSize: WidgetStateProperty.all(const Size(75, 75)),
                    alignment: Alignment.center,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
