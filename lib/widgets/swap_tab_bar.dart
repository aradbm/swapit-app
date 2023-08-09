// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:swapit_app/screens/items_screen.dart';

class ProfileTabBarNavigation extends StatelessWidget {
  ProfileTabBarNavigation({super.key});

  final List<Tab> myTabs = <Tab>[
    const Tab(
      text: 'LEFT',
      // child: const MyItemsScreen(),
    ),
    const Tab(text: 'RIGHT')
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: Container(
          padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            color: Colors.purple.shade50,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(children: <Widget>[
            TabBar(
              tabs: myTabs,
              unselectedLabelColor: Colors.black54,
              labelColor: Colors.black,
              // unselectedLabelStyle: kBoldText,
              // labelStyle: kBoldText,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
              ),
            ),
            Expanded(
              child: TabBarView(
                children: myTabs.map((Tab tab) {
                  final String? label = tab.text?.toLowerCase();
                  return Center(
                    child: Text(
                      'This is the $label tab',
                      style: const TextStyle(fontSize: 36),
                    ),
                  );
                }).toList(),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
