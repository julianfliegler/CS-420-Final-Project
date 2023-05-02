import 'package:flutter/material.dart';
import 'package:habit_app/all.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<HabitWidget> habitList = [];

  @override
  Widget build(BuildContext context) {
    print('HomePage build');
    return Scaffold(
      body: Center(
        child: _buildHabitList(habitList),
      ),
    );
  }
}

Widget _buildHabitList(List<HabitWidget> habitList) {
  // return one habit widget
  return HabitWidget(
    habit: Habit(
        name: 'Run',
        icon: const Icon(Icons.night_shelter_outlined,
            size: 40, color: Colors.black),
        color: Colors.yellow),
  );
}
