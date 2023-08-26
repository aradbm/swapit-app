import 'package:flutter/material.dart';
import 'package:swapit_app/screens/chat_screen.dart';
import 'package:swapit_app/screens/marketplace_screen/marketplace_screen.dart';
import 'package:swapit_app/screens/item_screens/profile_screen.dart';
import 'package:swapit_app/screens/swap_screens/swap_screen.dart';
import 'item_screens/items_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const MyItemsScreen();

    switch (_selectedPageIndex) {
      case 0:
        activePage = const ProfileScreen();
        break;
      case 1:
        activePage = const MarketPlaceScreen();
        break;
      case 2:
        activePage = const SwapScreen();
        break;
      case 3:
        activePage = const ChatScreen();
        break;
      // case 4:
      //   activePage = const ProfileScreen();
      default:
        activePage = const MarketPlaceScreen();
    }

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
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.person_pin_outlined),
          //   label: 'Profile',
          // ),
        ],
      ),
    );
  }
}
