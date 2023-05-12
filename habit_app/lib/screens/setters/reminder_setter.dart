/* 
==============================
*    Title: reminder_setter.dart
*    Author: Julian Fliegler
*    Date: May 2023
*    Purpose: Allows the user to set a reminder for a habit.
==============================
*/

// ref: https://www.fluttercampus.com/guide/40/how-to-show-time-picker-on-textfield-tap-and-get-formatted-time-in-flutter/
// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:habit_app/all.dart';
import 'package:intl/intl.dart';

class ReminderSetter extends StatefulWidget {
  Habit habit;

  ReminderSetter({super.key, required this.habit});

  @override
  State<ReminderSetter> createState() => ReminderSetterState();
}

class ReminderSetterState extends State<ReminderSetter> {
  TextEditingController timeinput = TextEditingController();
  Set<Week> weekSelection = <Week>{Week.M};

  @override
  void initState() {
    timeinput.text = ""; // set the initial value of text field
    super.initState();
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
                child: Text('Set reminder',
                    style: TextStyle(color: Colors.black))),
          ),
          resizeToAvoidBottomInset:
              false, // prevent keyboard from pushing up screen
          body: Column(
            children: [
              _buildTimePicker(),
              _buildWeekSelection(),
              const SizedBox(height: 70), // spacing
              _buildAddReminderButton(),
            ],
          ),
          // done button
          floatingActionButton: const MyApp().buildDoneButton(context),
        ));
  }

  Widget _buildTimePicker() {
    return Container(
        padding: const EdgeInsets.all(15),
        height: 150,
        child: Center(
            child: TextField(
          controller: timeinput, // editing controller of this TextField
          decoration: const InputDecoration(
              icon: Icon(Icons.timer), // icon of text field
              labelText: "Enter Time" // label text of field
              ),
          readOnly: true, // user unable to edit text
          onTap: () async {
            // open time picker on textField tap
            TimeOfDay? pickedTime = await showTimePicker(
              initialTime: TimeOfDay.now(),
              context: context,
            );

            if (pickedTime != null) {
              // reformat time
              final String formattedTime =
                  DateFormat('hh:mm a').format(DateTime(
                DateTime.now().year,
                DateTime.now().month,
                DateTime.now().day,
                pickedTime.hour,
                pickedTime.minute,
              ));

              setState(() {
                // set the value of text field
                timeinput.text = formattedTime;
                // set the habit reminder
                widget.habit.reminder?.time = formattedTime;
              });
            } else {
              debugPrint("Time is not selected");
            }
          },
        )));
  }

  Widget _buildWeekSelection() {
    return SegmentedButton<Week>(
      segments: const <ButtonSegment<Week>>[
        ButtonSegment<Week>(
          value: Week.M,
          label: Text('M'),
        ),
        ButtonSegment<Week>(
          value: Week.T,
          label: Text('T'),
        ),
        ButtonSegment<Week>(
          value: Week.W,
          label: Text('W'),
        ),
        ButtonSegment<Week>(
          value: Week.Th,
          label: Text('Th'),
        ),
        ButtonSegment<Week>(
          value: Week.F,
          label: Text('F'),
        ),
        ButtonSegment<Week>(
          value: Week.Sa,
          label: Text('Sa'),
        ),
        ButtonSegment<Week>(
          value: Week.Su,
          label: Text('Su'),
        ),
      ],
      selected: weekSelection,
      onSelectionChanged: (Set<Week> newSelection) {
        setState(() {
          weekSelection = newSelection;
          // set the habit reminder
          widget.habit.reminder?.weekSelection = weekSelection;
        });
      },
      multiSelectionEnabled: true,
    );
  }

  Widget _buildAddReminderButton() {
    return ElevatedButton.icon(
        onPressed: () {
          // TODO: add reminder to habit
        },
        icon: const Icon(Icons.add),
        label: const Text("Add reminder"));
  }
}
