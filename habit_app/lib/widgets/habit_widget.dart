/* 
==============================
*    Title: habit_widget.dart
*    Author: Julian Fliegler
*    Date: May 2023
*    Purpose: Creates a widget to display a habit.
==============================
*/

import 'package:flutter/material.dart';
import 'package:habit_app/all.dart';

// ignore: must_be_immutable
class HabitWidget extends StatefulWidget {
  @override
  HabitWidgetState createState() => HabitWidgetState();

  Habit habit;

  // constructor
  HabitWidget({super.key, required this.habit});
}

class HabitWidgetState extends State<HabitWidget> {
  @override
  void initState() {
    super.initState();
  }

  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //print("building item container");
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHabitContainer(),
        ],
      ),
    );
  }

  Widget _buildHabitContainer() {
    return Dismissible(
      key: UniqueKey(),
      // make the background red with a delete icon
      background: Container(
        color: const Color.fromARGB(255, 255, 68, 54),
        child: const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Icon(Icons.delete, color: Colors.white),
          ),
        ),
      ),
      onDismissed: (direction) {
        // remove the item from the list
        setState(() {
          const HomePage().removeHabit(widget);
          HomePageState().refresh();
        });
      },
      child: Padding(
        // padding between cards
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        child: Card(
          color: const Color.fromARGB(255, 255, 255, 255),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: const BorderSide(
              color: Color.fromARGB(255, 131, 131, 131),
              width: 1.0,
            ),
          ),
          elevation: 5.0,
          // padding inside card
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: SizedBox(
              height: 70,
              width: MediaQuery.of(context).size.width, // 100% of screen width
              child: ListTile(
                leading: _buildColorIcon(),
                title: Text(widget.habit.name ?? "",
                    style: const TextStyle(
                      fontSize: 25,
                    )),
                subtitle: _buildSubtitle(),
                trailing: _buildEditButton(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildSubtitle() {
    String selectedDays = '';

    // ignore: avoid_function_literals_in_foreach_calls
    widget.habit.goal?.weekSelection.forEach((element) {
      selectedDays += "${element.name} ";
    });

    // reformat edge cases
    if (selectedDays == "M T W Th F Sa Su ") {
      selectedDays = "Daily";
    } else if (selectedDays == "M T W Th F ") {
      selectedDays = "Weekdays";
    } else if (selectedDays == "Sa Su ") {
      selectedDays = "Weekends";
    }

    return widget.habit.goal?.quantity == null ||
            widget.habit.goal?.unit == null ||
            widget.habit.goal?.weekSelection == null
        ? const Text(
            "",
          )
        : Text(
            "${widget.habit.goal?.quantity} ${widget.habit.goal?.unit} | $selectedDays",
            style: const TextStyle(
              fontSize: 16,
            ));
  }

  Widget _buildEditButton() {
    return IconButton(
      icon: const Icon(
        Icons.edit,
        color: Color.fromRGBO(96, 103, 121, 1),
      ),
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return HabitPage(
                habit: widget.habit,
              );
            });
      },
    );
  }

  Widget _buildColorIcon() {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        // black outline
        border: Border.all(
          color: const Color.fromARGB(255, 138, 131, 145),
          width: 2,
        ),
        color: widget.habit.color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
          child: Icon(widget.habit.icon?.icon, color: Colors.black, size: 25)),
    );
  }
}
