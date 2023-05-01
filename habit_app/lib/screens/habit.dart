import 'package:flutter/material.dart';

class Habit extends StatefulWidget {
  const Habit({Key? key}) : super(key: key);

  @override
  State<Habit> createState() => _HabitState();
}

class _HabitState extends State<Habit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Habit'),
      ),
      body: const Center(
        child: Text('Habit'),
      ),
    );
  }
}
