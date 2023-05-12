import 'package:flutter/material.dart';
import 'package:habit_app/all.dart';

class HabitPage extends StatefulWidget {
  const HabitPage({Key? key}) : super(key: key);

  @override
  State<HabitPage> createState() => HabitPageState();
}

class HabitPageState extends State<HabitPage> {
  Goal thisGoal = Goal();
  Reminder thisReminder = Reminder();
  Reward thisReward = Reward();
  late Habit thisHabit;

  @override
  void initState() {
    super.initState();
    thisHabit =
        Habit(goal: thisGoal, reminder: thisReminder, reward: thisReward);
  }

  refresh() {
    if (mounted) {
      setState(() {});
    } else {
      print("$widget not mounted");
    }
  }

  @override
  Widget build(BuildContext context) {
    print("build habit page");
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
                  child: Text('Habit', style: TextStyle(color: Colors.black))),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                //  input field
                children: [
                  Flexible(child: _buildNameField()), // name
                  const SizedBox(height: 20), // spacing
                  Row(mainAxisSize: MainAxisSize.max, children: [
                    Expanded(child: _buildColorPicker(context)),
                    Expanded(child: _buildIconPicker(context))
                  ]),
                  const SizedBox(height: 20), // spacing
                  Flexible(child: _buildGoalSetter()),
                  const SizedBox(height: 20), // spacing
                  Flexible(child: _buildReminderSetter()),
                  const SizedBox(height: 20), // spacing
                  Flexible(child: _buildRewardSetter()),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              // round corners
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(28))),
              onPressed: () {
                // create new habit widget
                HabitWidget newHabitWidget = HabitWidget(
                  habit: thisHabit,
                );
                // add to list of habits
                HomePage().addHabit(newHabitWidget);
                // reload home page
                HomePageState().refresh();
                Navigator.pop(context);
              },
              backgroundColor: Colors.black,
              child: const Icon(Icons.done, color: Colors.white),
            )));
  }

  Widget _buildNameField() {
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
        callingWidget: widget,
        refreshParent: refresh,
        componentType: ColorPicker(
          habit: thisHabit,
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
            color: Color.fromARGB(255, 96, 91, 101),
            width: 2,
          ),
          color: thisHabit.color ?? Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }

  displayIcon() {
    return Padding(
      padding: const EdgeInsets.only(left: 57, top: 10, bottom: 10),
      child: Container(
        width: 60,
        height: 60,
        child: thisHabit.icon,
      ),
    );
  }

  displayGoal() {
    String selectedDayTimes = '';
    String selectedDays = '';
    // ignore: avoid_function_literals_in_foreach_calls
    thisHabit.goal?.daytimeSelection.forEach((element) {
      selectedDayTimes += "${element.name} ";
    });
    // ignore: avoid_function_literals_in_foreach_calls
    thisHabit.goal?.weekSelection.forEach((element) {
      selectedDays += "${element.name} ";
    });

    return Padding(
      padding: const EdgeInsets.only(left: 57, top: 10, bottom: 10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Column(
          children: [
            Text(
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
