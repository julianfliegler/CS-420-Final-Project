import 'package:habit_app/all.dart';

class Goal {
  String? quantity;
  String? unit;
  Calendar calendarView = Calendar.day;
  Set<DayTime> daytimeSelection = <DayTime>{DayTime.Morning};
  Set<Week> weekSelection = <Week>{Week.M};
}
