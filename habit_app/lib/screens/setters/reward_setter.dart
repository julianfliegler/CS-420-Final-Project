/* 
==============================
*    Title: reward_setter.dart
*    Author: Julian Fliegler
*    Date: May 2023
*    Purpose: Allows user to set a reward for a habit.
==============================
*/

// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:habit_app/all.dart';

class RewardSetter extends StatefulWidget {
  Habit habit;

  RewardSetter({Key? key, required this.habit}) : super(key: key);

  @override
  State<RewardSetter> createState() => _RewardSetterState();
}

class _RewardSetterState extends State<RewardSetter> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        home: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: const Center(
                child: Text('Set a reward',
                    style: TextStyle(color: Colors.black))),
          ),
          resizeToAvoidBottomInset:
              false, // prevent keyboard from pushing up screen
          body: Center(
            child: SingleChildScrollView(
              child: Column(children: [
                const Text("I will get",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                const SizedBox(height: 20), // spacing
                _buildRewardField(),
                const SizedBox(height: 40), // spacing
                const Text("after",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                const SizedBox(height: 20), // spacing
                _buildQuantityField(),
                const SizedBox(height: 20), // spacing
                _buildUnitField(),
              ]),
            ),
          ),
          floatingActionButton: const MyApp().buildDoneButton(context),
        ));
  }

  Widget _buildRewardField() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.89,
      child: TextFormField(
        decoration: const InputDecoration(
          // black border
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          // focused border
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          labelText: "Reward",
          labelStyle: TextStyle(color: Colors.black),
          focusColor: Colors.black,
        ),
        onChanged: (value) {
          if (value != "") {
            widget.habit.reward?.name = value;
          } else {
            // if user deletes all text
            widget.habit.reward?.name = "";
          }
          setState(() {});
        },
      ),
    );
  }

  Widget _buildQuantityField() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.89,
      child: TextFormField(
        // only allow numbers
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          // black border
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          // focused border
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          labelText: "Quantity",
          labelStyle: TextStyle(color: Colors.black),
          focusColor: Colors.black,
        ),
        onChanged: (value) {
          if (value != "") {
            widget.habit.reward?.quantity = value;
          } else {
            // if user deletes all text
            widget.habit.reward?.quantity = "";
          }
          setState(() {});
        },
      ),
    );
  }

  Widget _buildUnitField() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.89,
      child: TextFormField(
        decoration: const InputDecoration(
          // black border
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          // focused border
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          labelText: "Unit",
          labelStyle: TextStyle(color: Colors.black),
          focusColor: Colors.black,
        ),
        onChanged: (value) {
          if (value != "") {
            widget.habit.reward?.unit = value;
          } else {
            // if user deletes all text
            widget.habit.reward?.unit = "";
          }
          setState(() {});
        },
      ),
    );
  }
}
