import 'package:flutter/material.dart';
import 'package:swapit_app/models/bp_item.dart';

class BackPackTile extends StatelessWidget {
  const BackPackTile({super.key, required this.item});

  final BackPackItem item;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          print('tapped');
        },
        child: Container(
          height: 400,
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
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Image(
                      image: AssetImage(item.image),
                      fit: BoxFit.cover,
                      height: 200,
                      width: 200,
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
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
              // const Row(
              //   children: [
              //     SizedBox(width: 10),
              //     Text(
              //       'item',
              //       style: TextStyle(
              //           fontSize: 20,
              //           color: Colors.black,
              //           // add bold
              //           fontWeight: FontWeight.bold),
              //       softWrap: true,
              //       overflow: TextOverflow.fade,
              //     ),
              //     Spacer(),
              //     Text(
              //       'price',
              //       style: TextStyle(
              //           fontSize: 20,
              //           color: Colors.black,
              //           // add bold
              //           fontWeight: FontWeight.bold),
              //       softWrap: true,
              //       overflow: TextOverflow.fade,
              //     ),
              //   ],
              // ),
              // const Row(
              //   children: [
              //     FittedBox(
              //         fit: BoxFit.fitHeight,
              //         child: Icon(
              //           Icons.edit,
              //         )),
              //     Spacer(),
              //     FittedBox(
              //         fit: BoxFit.fitHeight,
              //         child: Icon(
              //           Icons.delete,
              //         )),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
