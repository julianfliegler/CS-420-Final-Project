import 'package:flutter/material.dart';
import 'package:habit_app/all.dart';

// ignore: must_be_immutable
class HabitWidget extends StatefulWidget {
  @override
  HabitWidgetState createState() => HabitWidgetState();

  Habit habit;

  // constructor
  HabitWidget({super.key, required this.habit});
}

class HabitWidgetState extends State<HabitWidget> {
  @override
  void initState() {
    super.initState();
  }

  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //print("building item container");
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHabitContainer(),
        ],
      ),
    );
  }

  Widget _buildHabitContainer() {
    return Dismissible(
      key: UniqueKey(),
      // make the background red with a delete icon
      background: Container(
        color: const Color.fromARGB(255, 255, 68, 54),
        child: const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Icon(Icons.delete, color: Colors.white),
          ),
        ),
      ),
      onDismissed: (direction) {
        // remove the item from the list
        setState(() {
          // remove from list
          HomePage().removeHabit(widget);
          // reload home page
          HomePageState().refresh();
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Card(
          color: const Color.fromARGB(255, 255, 255, 255),
          // outline
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: const BorderSide(
              color: Color.fromARGB(255, 131, 131, 131),
              width: 1.0,
            ),
          ),
          elevation: 5.0, // shadow
          // size of product widgets
          child: SizedBox(
            height: 70,
            width: MediaQuery.of(context).size.width, // 100% of screen width
            child: ListTile(
              leading: _buildColorIcon(),
              title: Text(widget.habit.name ?? "NULL",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  )),
              subtitle: _buildSubtitle(),
            ),
          ),
        ),
      ),
    );
  }

  _buildSubtitle() {
    String selectedDays = '';

    // ignore: avoid_function_literals_in_foreach_calls
    widget.habit.goal?.weekSelection.forEach((element) {
      selectedDays += "${element.name} ";
    });
    return Text(
        "${widget.habit.goal?.quantity} ${widget.habit.goal?.unit} | $selectedDays",
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ));
  }

  // Widget _buildEditButton() {
  //   return IconButton(
  //     icon: const Icon(
  //       Icons.edit,
  //       color: Color.fromRGBO(96, 103, 121, 1),
  //     ),
  //     onPressed: () {
  //       showDialog(
  //           context: context,
  //           builder: (context) {
  //             return EditWidget(
  //               pantryItem: widget.pantryItem,
  //               callingWidget: widget,
  //               updateProductWidget: refresh,
  //               refreshPantryList: widget.refreshPantryList,
  //             );
  //           });
  //     },
  //   );
  // }

  Widget _buildColorIcon() {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        // black outline
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        color: widget.habit.color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: widget.habit.icon,
      ),
    );
  }
}
