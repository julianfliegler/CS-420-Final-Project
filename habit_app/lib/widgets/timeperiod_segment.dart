import 'package:flutter/material.dart';

enum TimePeriod {
  morning,
  afternoon,
  evening,
}

class TimeSelection extends StatefulWidget {
  const TimeSelection({super.key});

  @override
  State<TimeSelection> createState() => _TimeSelectionState();
}

class _TimeSelectionState extends State<TimeSelection> {
  Set<TimePeriod> selection = <TimePeriod>{TimePeriod.morning};

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<TimePeriod>(
      segments: const <ButtonSegment<TimePeriod>>[
        ButtonSegment<TimePeriod>(
          value: TimePeriod.morning,
          label: Text('Morning'),
        ),
        ButtonSegment<TimePeriod>(
          value: TimePeriod.afternoon,
          label: Text('Afternoon'),
        ),
        ButtonSegment<TimePeriod>(
          value: TimePeriod.evening,
          label: Text('Evening'),
        ),
      ],
      selected: selection,
      onSelectionChanged: (Set<TimePeriod> newSelection) {
        setState(() {
          selection = newSelection;
        });
      },
      multiSelectionEnabled: true,
    );
  }
}
