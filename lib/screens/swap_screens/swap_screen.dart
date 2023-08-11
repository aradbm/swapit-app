import 'package:flutter/material.dart';
import 'package:swapit_app/screens/swap_screens/item_swap_screen.dart';

class SwapScreen extends StatelessWidget {
  const SwapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Swap Screen'),
        actions: const [
          Icon(Icons.settings, size: 30),
        ],
      ),
      body: Column(
        children: [
          const ItemsSwap(),
          // const Spacer(),
          Row(
            // tinder like buttons
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.close, size: 50),
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  fixedSize: MaterialStateProperty.all(const Size(75, 75)),
                ),
              ),
              IconButton(
                  icon: const Icon(Icons.warning_amber_rounded, size: 55),
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    fixedSize: MaterialStateProperty.all(const Size(75, 75)),
                    alignment: Alignment.topCenter,
                  )),
              IconButton(
                  icon: const Icon(Icons.favorite, size: 50),
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    fixedSize: MaterialStateProperty.all(const Size(75, 75)),
                    alignment: Alignment.center,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
