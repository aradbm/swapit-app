import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:swapit_app/screens/profile_screen/items_screen.dart';
import 'package:swapit_app/screens/profile_screen/settings_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _controller = TextEditingController();

  final user = FirebaseAuth.instance.currentUser!;
  @override
  void initState() {
    super.initState();
    _controller.text = user.displayName ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final Widget profileAvatar;
    if (user.photoURL == null) {
      profileAvatar = const Padding(
        padding: EdgeInsets.all(5.0),
        child: CircleAvatar(
          radius: 50,
          backgroundColor: Colors.white,
          child: Icon(Icons.person, size: 50, color: Colors.grey),
        ),
      );
    } else {
      profileAvatar = Padding(
        padding: const EdgeInsets.all(5.0),
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
