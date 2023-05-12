/* 
==============================
*    Title: color_picker.dart
*    Author: Julian Fliegler
*    Date: May 2023
*    Purpose: Allows user to pick a color for a habit.
==============================
*/

// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:habit_app/all.dart';

class ColorPicker extends StatefulWidget {
  late Habit habit;
  late Color? _selectedColor = Colors.white;

  ColorPicker({Key? key, required this.habit}) : super(key: key);

  @override
  State<ColorPicker> createState() => ColorPickerState();
}

class ColorPickerState extends State<ColorPicker> {
  // preset list of colors
  List<Color> colorList = [
    const Color(0xFFF95858),
    const Color(0xffFFA665),
    const Color(0xffFFDC61),
    const Color(0xff79FF76),
    const Color(0xff76FFCE),
    const Color(0xff76DEFF),
    const Color(0xff6B8CFF),
    const Color(0xffA276FF),
    const Color(0xffFF73D8)
  ];

  @override
  Widget build(BuildContext context) {
    // loop through color list and display each one in a solid circle, 3 to each row
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        home: Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.black),
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: const Center(
                  child: Text('Pick a color',
                      style: TextStyle(color: Colors.black))),
            ),
            resizeToAvoidBottomInset:
                false, // prevent keyboard from pushing up screen
            // display color list
            body: _buildColorList(),
            // display done button
            floatingActionButton: const MyApp().buildDoneButton(context)));
  }

  _buildColorList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      // display color list in a grid
      child: GridView.builder(
        itemCount: colorList.length,
        // 3 colors to each row
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              // when color tapped, set selected color to that color
              setState(() {
                // set local selected color
                widget._selectedColor = colorList[index];
                // set habit color
                widget.habit.color = widget._selectedColor;
              });
            },
            // display color in a solid circle
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  // if color is selected, display a thicker border
                  width: widget._selectedColor == colorList[index] ? 5 : 1,
                ),
                color: colorList[index],
                shape: BoxShape.circle,
              ),
            ),
          );
        },
      ),
    );
  }
}
