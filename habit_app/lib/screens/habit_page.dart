/* 
==============================
*    Title: habit_page.dart
*    Author: Julian Fliegler
*    Date: May 2023
*    Purpose: Displays and allows user to edit information for a habit.
==============================
*/

// ignore_for_file: must_be_immutable, avoid_print
import 'package:flutter/material.dart';
import 'package:habit_app/all.dart';

class HabitPage extends StatefulWidget {
  Habit? habit;

  // constructor
  HabitPage({Key? key, this.habit}) : super(key: key);

  @override
  State<HabitPage> createState() => HabitPageState();
}

class HabitPageState extends State<HabitPage> {
  Goal thisGoal = Goal();
  Reminder thisReminder = Reminder();
  Reward thisReward = Reward();
  late Habit thisHabit;
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    // if habit is null, create new habit
    if (widget.habit == null) {
      thisHabit =
          Habit(goal: thisGoal, reminder: thisReminder, reward: thisReward);
    } else {
      thisHabit = widget.habit as Habit;
      isEditing = true;
    }
  }

  refresh() {
    if (mounted) {
      setState(() {});
    } else {
      debugPrint("$widget not mounted");
    }
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
                  child: Text('Habit', style: TextStyle(color: Colors.black))),
            ),
            resizeToAvoidBottomInset:
                false, // prevent keyboard from pushing up screen
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true, // shrink to fit content
                children: [
                  _buildNameField(), // name
                  const SizedBox(height: 20), // spacing
                  Row(mainAxisSize: MainAxisSize.max, children: [
                    Expanded(child: _buildColorPicker(context)), // color
                    Expanded(child: _buildIconPicker(context)) // icon
                  ]),
                  const SizedBox(height: 20), // spacing
                  Flexible(child: _buildGoalSetter()), // goal
                  const SizedBox(height: 20), // spacing
                  Flexible(child: _buildReminderSetter()), // reminder
                  const SizedBox(height: 20), // spacing
                  Flexible(child: _buildRewardSetter()), // reward
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(28))), // round corners
              onPressed: () {
                // if not editing, user is creating a new habit
                if (!isEditing) {
                  // create new habit widget
                  HabitWidget newHabitWidget = HabitWidget(
                    habit: thisHabit,
                  );
                  // add to list of habits on home page
                  const HomePage().addHabit(newHabitWidget);
                }
                // go back to home page
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/', (Route<dynamic> route) => false);
              },
              backgroundColor: Colors.black,
              child: const Icon(Icons.done, color: Colors.white),
            )));
  }

  Widget _buildNameField() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.87,
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
          labelText: "Name",
          labelStyle: TextStyle(color: Colors.black),
          focusColor: Colors.black,
        ),
        onChanged: (value) {
          if (value != "") {
            thisHabit.name = value;
          } else {
            // if user deletes all text
            thisHabit.name = "";
          }
          setState(() {});
        },
      ),
    );
  }

  _buildColorPicker(context) {
    return BlankWidget(
        callingWidget: widget, // for tracking route
        refreshParent: refresh, // for updating state
        componentType: ColorPicker(
          habit: thisHabit, // pass habit to color picker
        ),
        displayWidget: displayColor(),
        labelText: "Color");
  }

  _buildIconPicker(context) {
    return BlankWidget(
        refreshParent: refresh,
        callingWidget: widget,
        componentType: IconPicker(
          habit: thisHabit,
        ),
        displayWidget: displayIcon(),
        labelText: "Icon");
  }

  _buildGoalSetter() {
    return BlankWidget(
        refreshParent: refresh,
        callingWidget: widget,
        componentType: GoalSetter(
          habit: thisHabit,
        ),
        displayWidget: displayGoal(),
        labelText: "Goal");
  }

  _buildReminderSetter() {
    return BlankWidget(
        refreshParent: refresh,
        callingWidget: widget,
        componentType: ReminderSetter(
          habit: thisHabit,
        ),
        displayWidget: displayReminder(),
        labelText: "Reminder");
  }

  _buildRewardSetter() {
    return BlankWidget(
        refreshParent: refresh,
        callingWidget: widget,
        componentType: RewardSetter(
          habit: thisHabit,
        ),
        displayWidget: displayReward(),
        labelText: "Reward");
  }

  displayColor() {
    return Padding(
      padding: const EdgeInsets.only(left: 57, top: 10, bottom: 10),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          // black border
          border: Border.all(
            color: const Color.fromARGB(255, 96, 91, 101),
            width: 2,
          ),
          // if color is null, display white
          color: thisHabit.color ?? Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }

  displayIcon() {
    return Padding(
      padding: const EdgeInsets.only(left: 57, top: 10, bottom: 10),
      child: SizedBox(
        width: 60,
        height: 60,
        child: Icon(
          thisHabit.icon?.icon,
          size: 50,
        ),
      ),
    );
  }

  displayGoal() {
    String selectedDayTimes = '';
    String selectedDays = '';
    // turn sets into strings
    // ignore: avoid_function_literals_in_foreach_calls
    thisHabit.goal?.daytimeSelection.forEach((element) {
      selectedDayTimes += "${element.name} ";
    });
    // ignore: avoid_function_literals_in_foreach_calls
    thisHabit.goal?.weekSelection.forEach((element) {
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

    return Padding(
      padding: const EdgeInsets.only(left: 57, top: 10, bottom: 10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Column(
          children: [
            Text(
                // if quantity is null, display empty string
                thisHabit.goal?.quantity == null
                    ? ""
                    : "${thisHabit.goal?.quantity.toString()} ${thisHabit.goal?.unit}",
                style: const TextStyle(fontSize: 20)),
            Container(
                // gray rounded rectangle
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 194, 188, 207),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5, horizontal: 8.0),
                    // if daytime selection is null, display empty string
                    child: selectedDayTimes == 'Morning '
                        ? Container()
                        : Text(selectedDayTimes))),

            const SizedBox(height: 5), // spacing
            Container(
                // gray rounded rectangle
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 194, 188, 207),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 8.0),
                  // if week selection is null, display empty string
                  child: selectedDays == 'M '
                      ? Container()
                      : Text(selectedDays,
                          style: const TextStyle(fontSize: 15)),
                ))
          ],
        ),
      ),
    );
  }

  displayReminder() {
    String selectedDays = '';
    // turn set into string
    // ignore: avoid_function_literals_in_foreach_calls
    thisHabit.reminder?.weekSelection.forEach((element) {
      selectedDays += "${element.name} ";
    });
    return Padding(
      padding: const EdgeInsets.only(left: 57, top: 10, bottom: 10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Column(
          children: [
            Text(
                // if time is null, display empty string
                thisHabit.reminder?.time == null
                    ? ""
                    : "${thisHabit.reminder?.time.toString()}",
                style: const TextStyle(fontSize: 20)),

            const SizedBox(height: 5), // spacing
            Container(
                // gray rounded rectangle
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 194, 188, 207),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 8.0),
                  // if week selection is null, display empty string
                  child: selectedDays == 'M '
                      ? Container()
                      : Text(selectedDays,
                          style: const TextStyle(fontSize: 15)),
                ))
          ],
        ),
      ),
    );
  }

  displayReward() {
    return Padding(
      padding: const EdgeInsets.only(left: 57, top: 10, bottom: 10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Column(
          children: [
            Text(
                // if reward name is null, display empty string
                thisHabit.reward?.name == null
                    ? ""
                    : "${thisHabit.reward?.name.toString()}",
                style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 5), // spacing
            Container(
              // gray rounded rectangle
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 194, 188, 207),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 8.0),
                child: Text(
                    // if reward quantity is null, display empty string
                    thisHabit.reward?.quantity == null
                        ? ""
                        : "${thisHabit.reward?.quantity.toString()} ${thisHabit.reward?.unit} streak",
                    style: const TextStyle(fontSize: 17)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
