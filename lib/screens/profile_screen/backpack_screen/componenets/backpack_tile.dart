import 'package:flutter/material.dart';
import 'package:swapit_app/models/backpack_item.dart';
import 'package:swapit_app/screens/profile_screen/backpack_screen/backpack_form.dart';

class BackPackTile extends StatelessWidget {
  const BackPackTile({super.key, required this.item});

  final BackPackItem item;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => AddBackPackItem(item: item),
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
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(30),
                  //   child: Image(
                  //     image: AssetImage(item.image),
                  //     fit: BoxFit.cover,
                  //     height: 200,
                  //     width: 200,
                  //   ),
                  // ),
                  // container with item.color
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      color: item.color,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        '\$${item.price}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: SizedBox(
                      height: 25,
                      width: 200,
                      child: Text(
                        item.title,
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
