/* 
==============================
*    Title: reminder.dart
*    Author: Julian Fliegler
*    Date: May 2023
*    Purpose: Holds information about a reminder.
==============================
*/

import 'package:habit_app/all.dart';

class Reminder {
  String? time;
  Set<Week> weekSelection = <Week>{Week.M};
}
