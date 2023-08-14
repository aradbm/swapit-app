import 'package:flutter/material.dart';

class MarketDrawer extends StatelessWidget {
  const MarketDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            curve: Curves.easeIn,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                ],
              ),
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Row(children: [
              Icon(
                Icons.filter_alt_outlined,
                size: 48,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              const SizedBox(width: 10),
              Text(
                'Filter by:',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
              ),
            ]),
          ),
          ListTile(
            title: const Text('Choose Category'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Price: Low to High'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
