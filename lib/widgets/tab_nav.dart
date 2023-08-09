import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class TabBarSampleClass extends StatefulWidget {
  const TabBarSampleClass({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabBarSampleClassState();
  }
}

class _TabBarSampleClassState extends State<TabBarSampleClass>
    with SingleTickerProviderStateMixin {
  late final _tabController = TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.book),
              text: 'TabOne',
            ),
            Tab(
              icon: Icon(Icons.chat),
              text: 'TabTwo',
            ),
            Tab(
              icon: Icon(Icons.access_alarm),
              text: 'TabThree',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_circle_right,
            ),
            iconSize: 50,
            color: Colors.green,
            splashColor: Colors.purple,
            onPressed: () {
              //Navigate to tab 2
              _tabController.index = 1;
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.arrow_circle_right,
            ),
            iconSize: 50,
            color: Colors.green,
            splashColor: Colors.purple,
            onPressed: () {
              //Navigate to tab 3
              _tabController.index = 2;
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.arrow_circle_right,
            ),
            iconSize: 50,
            color: Colors.green,
            splashColor: Colors.purple,
            onPressed: () {
              //Navigate to tab 1
              _tabController.index = 0;
            },
          ),
        ],
      ),
    );
  }
}
