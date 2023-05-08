import 'package:flutter/material.dart';

enum Week {
  m,
  t,
  w,
  th,
  f,
  sa,
  su,
}

class WeekSelection extends StatefulWidget {
  const WeekSelection({super.key});

  @override
  State<WeekSelection> createState() => _WeekSelectionState();
}

class _WeekSelectionState extends State<WeekSelection> {
  Set<Week> selection = <Week>{Week.m};

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Week>(
      segments: const <ButtonSegment<Week>>[
        ButtonSegment<Week>(
          value: Week.m,
          label: Text('M'),
        ),
        ButtonSegment<Week>(
          value: Week.t,
          label: Text('T'),
        ),
        ButtonSegment<Week>(
          value: Week.w,
          label: Text('W'),
        ),
        ButtonSegment<Week>(
          value: Week.th,
          label: Text('Th'),
        ),
        ButtonSegment<Week>(
          value: Week.f,
          label: Text('F'),
        ),
        ButtonSegment<Week>(
          value: Week.sa,
          label: Text('Sa'),
        ),
        ButtonSegment<Week>(
          value: Week.su,
          label: Text('Su'),
        ),
      ],
      selected: selection,
      onSelectionChanged: (Set<Week> newSelection) {
        setState(() {
          selection = newSelection;
        });
      },
      multiSelectionEnabled: true,
    );
  }
}
