import 'package:flutter/material.dart';
import 'package:swapit_app/models/backpack_item.dart';
import 'package:swapit_app/screens/item_screens/backpack_screen/edit_backpack_item.dart';

class BackPackTile extends StatelessWidget {
  const BackPackTile({super.key, required this.item});

  final BackPackItem item;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('tapped item ${item.name}');
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => EditBackPackItem(item: item),
          ),
        );
      },
      child: Container(
        height: 400,
        width: 200,
        foregroundDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.6),
            ],
          ),
        ),
        child: Column(
          children: [
            Flexible(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Hero(
                      tag: item.id,
                      child: Image(
                        image: AssetImage(item.image),
                        fit: BoxFit.cover,
                        height: 200,
                        width: 200,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: SizedBox(
                      height: 25,
                      width: 200,
                      child: Text(
                        item.name,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
