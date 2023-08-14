import 'package:flutter/material.dart';
import 'package:swapit_app/screens/marketplace_screen/widgets/market_drawer.dart';
import 'package:swapit_app/screens/marketplace_screen/widgets/marketplace_tile.dart';

import '../../data/user1_bp.dart';
import '../../models/bp_item.dart';

class MarketPlaceScreen extends StatefulWidget {
  const MarketPlaceScreen({super.key});

  @override
  State<MarketPlaceScreen> createState() => _MarketPlaceScreenState();
}

class _MarketPlaceScreenState extends State<MarketPlaceScreen> {
  List<BackPackItem> ls = dummyBackpackItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MarketDrawer(),
      appBar: AppBar(
        title: const Text('MarketPlace'),
        actions: const [
          SizedBox(
            height: 40,
            width: 170,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(width: 10),
            const Text('Filter by:'),
            const Spacer(),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black),
                backgroundColor:
                    MaterialStateProperty.all(Colors.lightBlueAccent),
              ),
              child: const Text('Shoes'),
            ),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black),
                backgroundColor:
                    MaterialStateProperty.all(Colors.lightBlueAccent),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              child: const Text('Clothes'),
            ),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black),
                backgroundColor:
                    MaterialStateProperty.all(Colors.lightBlueAccent),
              ),
              child: const Text('Electronics'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('See All'),
            ),
          ],
        ),
        Expanded(
          child: GridView.builder(
            itemCount: ls.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 0.9,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) => ItemTile(item: ls[index]),
          ),
        )
      ]),
    );
  }
}
