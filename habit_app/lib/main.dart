/* 
==============================
*    Title: main.dart
*    Author: Julian Fliegler
*    Date: May 2023
*    Purpose: Runs the app.
==============================
*/

import 'package:flutter/material.dart';
import 'package:habit_app/all.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/home': (context) => const HomePage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/progress': (context) => const ProgressPage(),
      },
      home: const Scaffold(
        body: MyPageController(),
      ),
    );
  }

  buildDoneButton(context) {
    return FloatingActionButton(
      // round corners
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(28))),
      onPressed: () {
        Navigator.pop(context);
      },
      backgroundColor: Colors.black,
      child: const Icon(Icons.done, color: Colors.white),
    );
  }
}
