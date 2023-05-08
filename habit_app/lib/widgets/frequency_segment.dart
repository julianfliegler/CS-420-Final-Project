import 'package:flutter/material.dart';
import 'package:habit_app/all.dart';

enum Calendar {
  day,
  week,
  month,
}

class FrequencySegment extends StatefulWidget {
  Calendar? calendarView = Calendar.day;

  FrequencySegment({super.key});

  @override
  State<FrequencySegment> createState() => _FrequencySegmentState();
}

class _FrequencySegmentState extends State<FrequencySegment> {
  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Calendar>(
      segments: const <ButtonSegment<Calendar>>[
        ButtonSegment<Calendar>(
          value: Calendar.day,
          label: Text('Per Day'),
        ),
        ButtonSegment<Calendar>(
          value: Calendar.week,
          label: Text('Per Week'),
        ),
        // ButtonSegment<Calendar>(
        //     value: Calendar.month,
        //     label: Text('Month'),
        //     icon: Icon(Icons.calendar_view_month)),
      ],
      selected: <Calendar>{widget.calendarView!},
      onSelectionChanged: (Set<Calendar> newSelection) {
        setState(() {
          // By default there is only a single segment that can be
          // selected at one time, so its value is always the first
          // item in the selected set.
          widget.calendarView = newSelection.first;
        });
        GoalSetterState().refresh();
      },
    );
  }
}
