// pages
export 'screens/page_controller.dart';
export 'screens/home_page.dart';
export 'screens/habit_page.dart';
export 'screens/progress_page.dart';

// pickers/setters
export 'screens/setters/color_picker.dart';
export 'screens/setters/goal_setter.dart';
export 'screens/setters/icon_picker.dart';
export 'screens/setters/reward_setter.dart';
export 'screens/setters/reminder_setter.dart';

// models
export 'models/habit.dart';
export 'models/goal.dart';
export 'models/reminder.dart';
export 'models/reward.dart';

// widgets
export 'widgets/habit_widget.dart';
export 'widgets/blank_widget.dart';

// utils
export 'utils/calendar_utils.dart';

// main
export 'main.dart';

// enums
// ignore_for_file: constant_identifier_names
enum Calendar {
  day,
  week,
}

enum DayTime {
  Morning,
  Afternoon,
  Evening,
}

enum Week {
  M,
  T,
  W,
  Th,
  F,
  Sa,
  Su,
}
