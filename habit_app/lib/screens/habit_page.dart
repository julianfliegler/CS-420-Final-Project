import 'package:flutter/material.dart';
import 'package:habit_app/all.dart';

class HabitPage extends StatefulWidget {
  const HabitPage({Key? key}) : super(key: key);

  @override
  State<HabitPage> createState() => HabitPageState();
}

class HabitPageState extends State<HabitPage> {
  Habit? thisHabit;

  refresh() {
    if (mounted) {
      

      setState(() {});
    }
    else{
      // mount page
      
    }
  }

  @override
  Widget build(BuildContext context) {
    print("build");
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
                    _buildNameField(), // name
                    const SizedBox(height: 20), // spacing
                    Row(mainAxisSize: MainAxisSize.max, children: [
                      Expanded(child: _buildColorPicker(context)),
                      Expanded(child: _buildIconPicker(context))
                    ]),
                    const SizedBox(height: 20), // spacing
                    _buildGoalSetter(),
                    const SizedBox(height: 20), // spacing
                    _buildReminderSetter(),
                    const SizedBox(height: 20), // spacing
                    _buildRewardSetter(),
                  ],
                ))));
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

          // suffixIcon: Icon(Icons.shopping_cart),
          // icon: const Icon(Icons.shopping_cart),
          // only show hint text if name null
          // hintText: widget.pantryItem.name == "" ? "Enter Name" : ""
        ),
        onChanged: (value) {
          if (value != "") {}
          //   widget.pantryItem.name = value;
          // } else {
          //   // if user deletes all text
          //   widget.pantryItem.name = "";
          // }
          setState(() {});
        },
      ),
    );
  }

  _buildColorPicker(context) {
    return BlankWidget(
        componentType: ColorPicker(
          habit: // if habit exists, pass habit, else create new habit
              thisHabit ?? Habit(),
        ),
        displayWidget: ColorPickerState().displayColor(),
        labelText: "Color");
  }

  _buildIconPicker(context) {
    return BlankWidget(
        componentType: const IconPicker(),
        displayWidget: IconPickerState().displayIcon());
  }

  _buildGoalSetter() {
    return BlankWidget(componentType: GoalSetter());
  }

  _buildReminderSetter() {
    return BlankWidget(
      componentType: ReminderSetter(
        habit: thisHabit ?? Habit(),
      ),
      displayWidget: displayReminder(),
    );
  }

  _buildRewardSetter() {
    return BlankWidget(componentType: RewardSetter());
  }

  displayReminder() {
    print("reload");
    // get time of day and selected days of week
    // display reminder
    print(thisHabit?.reminder ?? "no reminder set");
  }
}
