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
              // make back arrow black
              iconTheme: const IconThemeData(color: Colors.black),
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: const Center(
                  child: Text('Pick a color',
                      style: TextStyle(color: Colors.black))),
            ),
            body: _buildColorList(),
            // add 'done' button to bottom right
            floatingActionButton: const MyApp().buildDoneButton(context)));
  }

  _buildColorList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GridView.builder(
        itemCount: colorList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              // when color tapped, set selected color to that color
              // set habit color to selected color
              setState(() {
                widget._selectedColor = colorList[index];
                widget.habit.color = widget._selectedColor;
              });
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
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
