import 'package:flutter/material.dart';
import 'package:swapit_app/models/backpack_item.dart';

class EditBackPackItem extends StatelessWidget {
  const EditBackPackItem({super.key, required this.item});

  final BackPackItem item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(item.name),
      ),
      body: Stack(
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
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                softWrap: true,
                overflow: TextOverflow.fade,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
