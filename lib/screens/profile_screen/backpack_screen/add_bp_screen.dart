import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swapit_app/models/backpack_item.dart';
import 'package:swapit_app/providers/user_provider.dart';
import '../../../models/user.dart';

class AddBackPackItem extends ConsumerStatefulWidget {
  const AddBackPackItem({this.item, super.key});
  final BackPackItem? item;
  @override
  ConsumerState<AddBackPackItem> createState() => _AddBackPackItemState();
}

class _AddBackPackItemState extends ConsumerState<AddBackPackItem> {
  @override
  Widget build(BuildContext context) {
    AsyncValue<User> loggedUser = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a random backpack item'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 200,
              width: 300,
              padding: const EdgeInsets.all(10),
              child: loggedUser.when(
                data: (user) => Text(user.toString()),
                loading: () => const CircularProgressIndicator(),
                error: (error, stackTrace) => Text(error.toString()),
              ),
            ),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: widget.item == null
                      ? const SizedBox()
                      : Hero(
                          tag: widget.item!.id,
                          child: Image(
                            image: AssetImage(widget.item!.image),
                            fit: BoxFit.cover,
                            height: 200,
                            width: 200,
                          ),
                        ),
                ),
                widget.item != null
                    ? Positioned(
                        bottom: 0,
                        child: SizedBox(
                          height: 25,
                          width: 200,
                          child: Text(
                            widget.item!.id,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
