/* 
==============================
*    Title: icon_picker.dart
*    Author: Julian Fliegler
*    Date: May 2023
*    Purpose: Allows the user to pick an icon for a habit.
==============================
*/

import 'package:flutter/material.dart';
import 'package:habit_app/all.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';

// ignore: must_be_immutable
class IconPicker extends StatefulWidget {
  late Habit habit;

  IconPicker({super.key, required this.habit});

  @override
  State<IconPicker> createState() => IconPickerState();
}

class IconPickerState extends State<IconPicker> {
  Icon? _icon;

  @override
  void initState() {
    super.initState();
    // wait for the widget to build before picking an icon
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _pickIcon();
    });
  }

  _pickIcon() async {
    IconData? icon = await FlutterIconPicker.showIconPicker(context,
        iconPackModes: [IconPack.cupertino]);

    _icon = Icon(icon);
    // set the icon for the habit
    widget.habit.icon = _icon;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        home: Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.black),
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: const Center(
                  child: Text('Pick an icon',
                      style: TextStyle(color: Colors.black))),
            ),
            resizeToAvoidBottomInset:
                false, // prevent keyboard from pushing up screen
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // switch between the old and new icon
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: Icon(
                          _icon?.icon,
                          size: 100,
                        )),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _pickIcon,
                    child: const Text('Select New Icon'),
                  ),
                ],
              ),
            ),
            // done button
            floatingActionButton: const MyApp().buildDoneButton(context)));
  }
}
