import 'package:flutter/material.dart';
import 'package:habit_app/all.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyPageController(),
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
