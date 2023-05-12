import 'package:flutter/material.dart';
import 'package:habit_app/all.dart';

class Habit {
  int? id;
  String? name;
  Icon? icon;
  Color? color;
  Goal? goal;
  Reminder? reminder;
  Reward? reward;

  // constructor
  Habit(
      {this.id,
      this.name,
      this.icon,
      this.color,
      this.goal,
      this.reminder,
      this.reward});
}
