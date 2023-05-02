import 'package:flutter/material.dart';

class HabitPage extends StatefulWidget {
  const HabitPage({Key? key}) : super(key: key);

  @override
  State<HabitPage> createState() => _HabitPageState();
}

class _HabitPageState extends State<HabitPage> {
  bool isFilled = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              //  input field
              children: [
                const SizedBox(height: 20), // spacing
                _buildNameField(), // name
              ],
            )));
  }

  Widget _buildNameField() {
    return TextFormField(
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
        labelText: "Name",
        labelStyle: TextStyle(color: Colors.black),
        focusColor: Colors.black,
        fillColor: Colors.grey,
        filled: true,

        // suffixIcon: Icon(Icons.shopping_cart),
        // icon: const Icon(Icons.shopping_cart),
        // only show hint text if name null
        // hintText: widget.pantryItem.name == "" ? "Enter Name" : ""
      ),
      onChanged: (value) {
        if (value != "") {
          // toggle isFilled
          isFilled = true;
        }
        //   widget.pantryItem.name = value;
        // } else {
        //   // if user deletes all text
        //   widget.pantryItem.name = "";
        // }
        setState(() {});
      },
    );
  }
}
