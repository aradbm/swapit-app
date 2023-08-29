import 'package:flutter/material.dart';
import 'package:swapit_app/models/wl_item.dart';

class WishListTile extends StatelessWidget {
  const WishListTile({super.key, required this.item});

  final WishListItem item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: [
              item.color.withOpacity(1),
              item.color.withOpacity(0),
            ],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 20),
            IconButton.filledTonal(
              icon: const Icon(Icons.headset_outlined),
              onPressed: () {},
              color: item.color,
              // splashColor: item.color,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
              highlightColor: item.color,
            ),
            const SizedBox(width: 50),
            Text(item.category),
          ],
        ),
      ),
    );
  }
}