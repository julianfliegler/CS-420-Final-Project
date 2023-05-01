/* 
==============================
*    Title: page_controller.dart
*    Author: Julian Fliegler
*    Date: May 2023
==============================
*/

import 'package:habit_app/screens/all.dart'; // all screens
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';

class MyPageController extends StatefulWidget {
  const MyPageController({Key? key}) : super(key: key);

  @override
  State<MyPageController> createState() => _MyPageControllerState();
}

// Following this tutorial: https://api.flutter.dev/flutter/material/NavigationBar-class.html
class _MyPageControllerState extends State<MyPageController> {
  int _currentIndex = 0;
  final _pageOptions = [
    const Home(),
    const Habit(),
    const Progress(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pageOptions
            .elementAt(_currentIndex), // move to page at selected index
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (int newIndex) {
          setState(() {
            HapticFeedback.lightImpact(); // add haptic feedback

            _currentIndex = newIndex;
          });
        },
        backgroundColor: Colors.transparent,
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.add_circle),
            icon: Icon(Icons.add_circle_outline),
            label: 'Add',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bar_chart),
            icon: Icon(Icons.bar_chart_outlined),
            label: 'Progress',
          ),
        ],
      ),
    );
  }
}
