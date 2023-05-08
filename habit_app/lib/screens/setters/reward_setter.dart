import 'package:flutter/material.dart';
import 'package:habit_app/all.dart';

class RewardSetter extends StatefulWidget {
  const RewardSetter({Key? key}) : super(key: key);

  @override
  State<RewardSetter> createState() => _ProgressState();
}

class _ProgressState extends State<RewardSetter> {
  @override
  Widget build(BuildContext context) {
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
                child: Text('Set a reward',
                    style: TextStyle(color: Colors.black))),
          ),
          body: const Center(
            child: Text('reward'),
          ),
          floatingActionButton: const MyApp().buildDoneButton(context),
        ));
  }
}
