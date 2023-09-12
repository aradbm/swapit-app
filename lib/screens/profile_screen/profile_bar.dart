import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swapit_app/providers/backpack_provider.dart';
import 'package:swapit_app/providers/swapcards_provider.dart';
import 'package:swapit_app/screens/profile_screen/items_screen.dart';
import 'package:swapit_app/screens/profile_screen/settings_screen.dart';

import '../../providers/wishlist_provider.dart';

class ProfileScreen extends ConsumerWidget {
  ProfileScreen({super.key});
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context, ref) {
    final Widget profileAvatar;
    if (user.photoURL == null) {
      profileAvatar = const Padding(
        padding: EdgeInsets.all(4.0),
        child: CircleAvatar(
          radius: 50,
          backgroundColor: Colors.white,
          child: Icon(Icons.person, size: 45, color: Colors.grey),
        ),
      );
    } else {
      profileAvatar = Padding(
        padding: const EdgeInsets.all(4.0),
        child: CircleAvatar(
            radius: 50,
            backgroundColor: Theme.of(context).primaryColor,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(user.photoURL ?? ''))),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi! ${user.displayName ?? ''}'),
        leading: profileAvatar,
        toolbarHeight: 70,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsScreen()));
              },
              icon: const Icon(Icons.settings)),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Logout'),
                  content: const Text('Are you sure you want to logout?'),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('No')),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          FirebaseAuth.instance.signOut();
                          ref.read(wishListProvider).dispose();
                          ref.read(backPackProvider).dispose();
                          ref.read(swapCardsProvider).dispose();
                        },
                        child: const Text('Yes')),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: const MyItemsScreen(),
    );
  }
}
