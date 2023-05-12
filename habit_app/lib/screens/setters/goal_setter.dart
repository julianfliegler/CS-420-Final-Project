/* 
==============================
*    Title: goal_setter.dart
*    Author: Julian Fliegler
*    Date: May 2023
*    Purpose: Allows the user to set a goal for a habit.
==============================
*/

// ref: https://api.flutter.dev/flutter/material/SegmentedButton-class.html
// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:habit_app/all.dart';

class GoalSetter extends StatefulWidget {
  Habit? habit;

  GoalSetter({Key? key, this.habit}) : super(key: key);

  @override
  State<GoalSetter> createState() => GoalSetterState();
}

class GoalSetterState extends State<GoalSetter> {
  Calendar calendarView = Calendar.day;
  Set<DayTime> daytimeSelection = <DayTime>{DayTime.Morning};
  Set<Week> weekSelection = <Week>{Week.M};

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
                child:
                    Text('Set a goal', style: TextStyle(color: Colors.black))),
          ),
          resizeToAvoidBottomInset:
              false, // prevent keyboard from pushing up screen
          body: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Center(
                    // size of the individual buttons itself
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: _buildFrequencySelection())),
              ),
              const SizedBox(height: 30), // spacing
              // week selection
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Center(
                      // size of the individual buttons itself
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          // display either day or week selection
                          child: calendarView == Calendar.day
                              ? _buildDayTimeSelection()
                              : _buildWeekSelection()))),
              const SizedBox(height: 30), // spacing
              // quantity and unit
              _buildQuantityField(),
              const SizedBox(height: 20), // spacing
              _buildUnitField(),
            ],
          ),
          // display done button
          floatingActionButton: const MyApp().buildDoneButton(context)),
    );
  }

  Widget _buildFrequencySelection() {
    return SegmentedButton<Calendar>(
      segments: const <ButtonSegment<Calendar>>[
        ButtonSegment<Calendar>(
          value: Calendar.day,
          label: Text('Per Day'),
        ),
        ButtonSegment<Calendar>(
          value: Calendar.week,
          label: Text('Per Week'),
        ),
      ],
      // default selection
      selected: <Calendar>{calendarView},
      onSelectionChanged: (Set<Calendar> newSelection) {
        setState(() {
          // By default there is only a single segment that can be selected at one time, so its value is always the first item in the selected set.
          calendarView = newSelection.first;
          // update the habit's goal
          widget.habit?.goal?.calendarView = calendarView;
        });
      },
    );
  }

  Widget _buildDayTimeSelection() {
    return SegmentedButton<DayTime>(
      segments: const <ButtonSegment<DayTime>>[
        ButtonSegment<DayTime>(
          value: DayTime.Morning,
          label: Text('Morning'),
        ),
        ButtonSegment<DayTime>(
          value: DayTime.Afternoon,
          label: Text('Afternoon'),
        ),
        ButtonSegment<DayTime>(
          value: DayTime.Evening,
          label: Text('Evening'),
        ),
      ],
      selected: daytimeSelection,
      onSelectionChanged: (Set<DayTime> newSelection) {
        setState(() {
          daytimeSelection = newSelection;
          // update the habit's goal
          widget.habit?.goal?.daytimeSelection = daytimeSelection;
        });
      },
      multiSelectionEnabled: true,
    );
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
          // update the habit's goal
          widget.habit?.goal?.weekSelection = weekSelection;
        });
      },
      // allow multiple selections
      multiSelectionEnabled: true,
    );
  }

  Widget _buildQuantityField() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.89,
      child: TextFormField(
        // only allow numbers
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          // black border
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          // focused border
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          labelText: "Quantity",
          labelStyle: TextStyle(color: Colors.black),
          focusColor: Colors.black,
        ),
        onChanged: (value) {
          if (value != "") {
            // update the habit's goal
            widget.habit?.goal?.quantity = value;
          } else {
            // if user deletes all text
            widget.habit?.goal?.quantity = "";
          }
          setState(() {});
        },
      ),
    );
  }

  Widget _buildUnitField() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.89,
      child: TextFormField(
        decoration: const InputDecoration(
          // black border
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          // focused border
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          labelText: "Unit",
          labelStyle: TextStyle(color: Colors.black),
          focusColor: Colors.black,
        ),
        onChanged: (value) {
          if (value != "") {
            widget.habit?.goal?.unit = value;
          } else {
            // if user deletes all text
            widget.habit?.goal?.unit = "";
          }
          setState(() {});
        },
      ),
    );
  }
}
