import 'package:flutter/material.dart';
import 'package:habit_app/all.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  static List<HabitWidget>? habitList;
  addHabit(HabitWidget habit) {
    habitList ??= []; // initialize if null
    habitList?.add(habit);
  }

  removeHabit(HabitWidget habit) {
    habitList?.remove(habit);
  }

  // getter
  List<HabitWidget>? getHabitList() {
    return habitList;
  }

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        home: Scaffold(
          body: Column(
            children: [
              _buildCalendar(),
              Center(
                child: widget.getHabitList() != null
                    ? _buildHabitList(
                        widget.getHabitList() as List<HabitWidget>)
                    : Container(),
              ),
            ],
          ),
        ));
  }

  Widget _buildHabitList(List<HabitWidget> habitList) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: habitList.length,
        itemBuilder: (context, index) {
          return habitList[index];
        });
  }

  _buildCalendar() {
    return TableCalendar(
      firstDay: kFirstDay,
      lastDay: kLastDay,
      focusedDay: _focusedDay,
      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
      calendarFormat: _calendarFormat,
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        }
      },
      onFormatChanged: (format) {
        print('onFormatChanged: $format');
        if (_calendarFormat != format) {
          setState(() {
            _calendarFormat = format;
          });
        }
      },
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
    );
  }
}
