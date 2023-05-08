/* 
==============================
*    Title: page_controller.dart
*    Author: Julian Fliegler
*    Date: May 2023
==============================
*/

import 'package:habit_app/all.dart'; // all screens
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
  int _selectedIndex = 0;
  final _pageOptions = [
    const HomePage(),
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
      body: Center(
        child: _pageOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Stack(
        alignment: const FractionalOffset(.5, 1.0),
        children: [
          BottomNavigationBar(
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
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            // add habit button
            child: FloatingActionButton(
              backgroundColor: Colors.black,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HabitPage(),
                  ),
                );
              },
              child: const Icon(Icons.add_outlined, size: 40),
            ),
          ),
        ],
      ),
    );
  }
}
