/* 
==============================
*    Title: blank_widget.dart
*    Author: Julian Fliegler
*    Date: May 2023
*    Purpose: Creates a blank widget that can be used to display habit components.
==============================
*/

// ref: https://stackoverflow.com/questions/57864400/flutter-how-create-card-with-label-in-left-top
// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:habit_app/all.dart';

// ignore: must_be_immutable
class BlankWidget extends StatefulWidget {
  @override
  BlankWidgetState createState() => BlankWidgetState();

  Widget componentType;
  Widget? displayWidget;
  String? labelText;
  Widget callingWidget;
  final Function()? refreshParent;

  BlankWidget(
      {super.key,
      required this.componentType,
      this.displayWidget,
      this.labelText,
      required this.callingWidget,
      required this.refreshParent});
}

class BlankWidgetState extends State<BlankWidget> {
  @override
  void initState() {
    super.initState();
  }

  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildContainer(),
        ],
      ),
    );
  }

  Widget _buildContainer() {
    //print(widget.displayWidget);
    return Card(
      // outline
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: const BorderSide(
          color: Color.fromARGB(255, 138, 131, 145),
          width: 1.0,
        ),
      ),
      elevation: 5.0, // shadow
      shadowColor: const Color.fromARGB(255, 164, 159, 184),
      // size of product widgets

      child: Stack(
        children: <Widget>[
          _buildMainWidget(),
          if (widget.labelText != null) _buildLabel(),
        ],
      ),
    );
  }

  Widget _buildEditButton() {
    return IconButton(
        alignment: Alignment.bottomCenter,
        icon: const Icon(
          Icons.edit,
          color: Color.fromRGBO(96, 103, 121, 1),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widget.componentType),
          ).then((_) {
            setState(() {});
            widget.refreshParent!();
          });
        });
  }

  Widget _buildAddButton() {
    return IconButton(
        alignment: Alignment.bottomCenter,
        icon: const Icon(
          Icons.add,
          color: Color.fromRGBO(96, 103, 121, 1),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widget.componentType),
          ).then((_) {
            setState(() {});
            widget.refreshParent!();
          });
        });
  }

  _buildMainWidget() {
    return SizedBox(
      // height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width, // 100% of screen width
      // add edit button to end of card
      child: Row(
        children: [
          widget.displayWidget ?? const Spacer(),
          widget.displayWidget != null ? _buildEditButton() : _buildAddButton()
        ],
      ),
    );
  }

  _buildLabel() {
    return Positioned(
        top: 0,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
          decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 155, 149, 173),
                  blurRadius: 1.0,
                  spreadRadius: 0.0,
                  offset: Offset(0.5, 2.0),
                ),
              ],
              color: Color.fromARGB(255, 215, 209, 231),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomRight: Radius.circular(8),
              ) // green shaped
              ),
          child: Text(widget.labelText as String,
              style: const TextStyle(
                  color: Color.fromARGB(255, 35, 35, 75),
                  fontSize: 15,
                  fontWeight: FontWeight.w500)),
        ));
  }
}
