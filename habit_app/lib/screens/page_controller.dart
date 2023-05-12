/* 
==============================
*    Title: page_controller.dart
*    Author: Julian Fliegler
*    Date: May 2023
*    Purpose: Manages navigation bar.
==============================
*/

import 'package:habit_app/all.dart'; // all screens
import 'package:flutter/material.dart';

class MyPageController extends StatefulWidget {
  const MyPageController({Key? key}) : super(key: key);

  @override
  State<MyPageController> createState() => _MyPageControllerState();
}

// Following this tutorial: https://api.flutter.dev/flutter/material/NavigationBar-class.html
class _MyPageControllerState extends State<MyPageController> {
  int _selectedIndex = 0;
  final _pageOptions = [
    const HomePage(),
    HabitPage(),
    const ProgressPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffdfafd),
      body: Center(
        child: _pageOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Stack(
        alignment: const FractionalOffset(.5, 1.0),
        children: [
          BottomNavigationBar(
            backgroundColor: const Color.fromARGB(210, 255, 250, 250),
            elevation: 0,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(right: 50),
                  child: Icon(Icons.home_outlined, size: 45),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.only(right: 50),
                  child: Icon(Icons.home, size: 50),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(left: 3),
                  child: Icon(Icons.add_circle_outline, size: 45),
                ),
                activeIcon: Padding(
                    padding: EdgeInsets.only(left: 3),
                    child: Icon(Icons.add_circle, size: 50)),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: Icon(Icons.bar_chart_outlined, size: 45),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: Icon(Icons.bar_chart, size: 50),
                ),
                label: '',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.black,
            onTap: _onItemTapped,
          ),
        ],
      ),
    );
  }
}
