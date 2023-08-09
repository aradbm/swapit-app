import 'package:flutter/material.dart';
import 'package:swapit_app/models/bp_item.dart';
import 'package:swapit_app/data/user1_bp.dart';

class BackPackScrreen extends StatefulWidget {
  const BackPackScrreen({super.key});

  @override
  State<BackPackScrreen> createState() => _BackPackScrreenState();
}

class _BackPackScrreenState extends State<BackPackScrreen> {
  List<BackPackItem> ls = dummyBackpackItems;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          ...ls.map(
            (e) => Container(
              decoration: BoxDecoration(
                color: e.color,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image.file(e.image, height: 100, width: 100),
                  Text(e.name),
                  Text(e.price.toString()),
                ],
              ),
            ),
          ),
          ...ls.map(
            (e) => Container(
              decoration: BoxDecoration(
                color: e.color,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image.file(e.image, height: 100, width: 100),
                  Text(e.name),
                  Text(e.price.toString()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
