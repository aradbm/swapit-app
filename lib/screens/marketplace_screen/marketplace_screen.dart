import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swapit_app/screens/marketplace_screen/widgets/market_drawer.dart';
import 'package:swapit_app/screens/marketplace_screen/widgets/marketplace_tile.dart';
import '../../models/backpack_item.dart';

class MarketPlaceScreen extends ConsumerStatefulWidget {
  const MarketPlaceScreen({super.key});

  @override
  ConsumerState<MarketPlaceScreen> createState() => _MarketPlaceScreenState();
}

class _MarketPlaceScreenState extends ConsumerState<MarketPlaceScreen> {
  List<BackPackItem> ls = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MarketDrawer(),
      appBar: AppBar(
        title: const Text('MarketPlace'),
        actions: const [
          SizedBox(
            height: 40,
            width: 230,
            child: TextField(
              style: TextStyle(fontSize: 16),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(2.0),
                prefixIcon: Icon(Icons.search),
                hintText: 'Search for item',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(children: [
        // CategoriesPicker(categories: categories, onChanged: ,),
        const SizedBox(height: 10),
        Expanded(
          child: GridView.builder(
            itemCount: ls.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 0.9,
              crossAxisSpacing: 15,
              mainAxisSpacing: 7,
            ),
            itemBuilder: (context, index) => ItemTile(item: ls[index]),
          ),
        )
      ]),
    );
  }
}
