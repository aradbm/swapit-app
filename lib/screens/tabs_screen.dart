import 'package:flutter/material.dart';
import 'package:swapit_app/screens/chat_screen.dart';
import 'package:swapit_app/screens/marketplace_screen/marketplace_screen.dart';
import 'package:swapit_app/screens/profile_screen/profile_bar.dart';
import 'package:swapit_app/screens/swap_screens/swap_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() => _selectedPageIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = ProfileScreen();

    activePage = switch (_selectedPageIndex) {
      0 => ProfileScreen(),
      1 => const MarketPlaceScreen(),
      2 => const SwapScreen(),
      3 => const ChatScreen(),
      _ => const MarketPlaceScreen()
    };

    return Scaffold(
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.backpack_outlined),
            label: 'Items',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sell_outlined),
            label: 'Market',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horizontal_circle_outlined),
            label: 'Swap',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_outlined),
            label: 'Chat',
          ),
        ],
      ),
    );
  }
}
