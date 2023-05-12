// import 'package:flutter/material.dart';



// class TimeSelection extends StatefulWidget {
//   const TimeSelection({super.key});

//   @override
//   State<TimeSelection> createState() => _TimeSelectionState();
// }

// class _TimeSelectionState extends State<TimeSelection> {
//   Set<DayTime> selection = <DayTime>{DayTime.morning};

//   @override
//   Widget build(BuildContext context) {
//     return SegmentedButton<DayTime>(
//       segments: const <ButtonSegment<DayTime>>[
//         ButtonSegment<DayTime>(
//           value: DayTime.morning,
//           label: Text('Morning'),
//         ),
//         ButtonSegment<DayTime>(
//           value: DayTime.afternoon,
//           label: Text('Afternoon'),
//         ),
//         ButtonSegment<DayTime>(
//           value: DayTime.evening,
//           label: Text('Evening'),
//         ),
//       ],
//       selected: selection,
//       onSelectionChanged: (Set<DayTime> newSelection) {
//         setState(() {
//           selection = newSelection;
//         });
//       },
//       multiSelectionEnabled: true,
//     );
//   }
// }
