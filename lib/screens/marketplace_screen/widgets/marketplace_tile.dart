import 'package:flutter/material.dart';
import 'package:swapit_app/models/bp_item.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({super.key, required this.item});

  final BackPackItem item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Column(
        children: [
          Container(
            height: 185,
            width: 200,
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.5),
                ],
              ),
            ),
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(item.image),
                fit: BoxFit.fill,
              ),
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.name,
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    // add bold
                    fontWeight: FontWeight.bold),
                softWrap: true,
                overflow: TextOverflow.fade,
              ),
              const Text(
                '•',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              Text(
                '₪${item.price.toString()}',
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    // add bold
                    fontWeight: FontWeight.bold),
                softWrap: true,
                overflow: TextOverflow.fade,
              ),
            ],
          )
        ],
      ),
    );
  }
}
