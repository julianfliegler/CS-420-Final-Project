// ref: https://api.flutter.dev/flutter/material/SegmentedButton-class.html
import 'package:flutter/material.dart';
import 'package:habit_app/all.dart';

class GoalSetter extends StatefulWidget {
  const GoalSetter({Key? key}) : super(key: key);

  @override
  State<GoalSetter> createState() => GoalSetterState();
}

class GoalSetterState extends State<GoalSetter> {
  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(FrequencySegment().calendarView);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
          appBar: AppBar(
            // make back arrow black
            iconTheme: const IconThemeData(color: Colors.black),
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: const Center(
                child:
                    Text('Set a goal', style: TextStyle(color: Colors.black))),
          ),
          body: Column(
            children: [
              // type of time selection
              SizedBox(
                // fit button width to screen width
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                child: Center(
                    // size of the individual buttons itself
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: FrequencySegment())),
              ),
              // week selection
              SizedBox(
                  // height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                      // size of the individual buttons itself
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: FrequencySegment().calendarView == Calendar.day
                              ? TimeSelection()
                              : WeekSelection()))),
            ],
          ),
          floatingActionButton: const MyApp().buildDoneButton(context)),
    );
  }
}
