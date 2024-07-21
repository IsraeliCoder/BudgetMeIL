
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_item.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = SafeArea(child: AddItem());
      case 1:
        page = SafeArea(child: Placeholder());
      case 2:
        page = SafeArea(child: Placeholder());
      case 3:
        page = SafeArea(child: Placeholder());
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    // All Free Icons  https://www.flaticon.com/free-icons/all
    // and https://fonts.google.com/icons
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart),
              label: 'Add Item',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.manage_history),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.timeline),
              label: 'Statistics',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'settings',
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Theme.of(context).colorScheme.inversePrimary,
          onTap: _onItemTapped,
        ),
        body: Row(
          children: [
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }
}
