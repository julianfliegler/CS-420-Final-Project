/* 
==============================
*    Title: goal.dart
*    Author: Julian Fliegler
*    Date: May 2023
*    Purpose: Holds information about a goal.
==============================
*/

import 'package:habit_app/all.dart';

class Goal {
  String? quantity;
  String? unit;
  Calendar calendarView = Calendar.day;
  Set<DayTime> daytimeSelection = <DayTime>{DayTime.Morning};
  Set<Week> weekSelection = <Week>{Week.M};
}
