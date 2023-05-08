// ref: https://stackoverflow.com/questions/57864400/flutter-how-create-card-with-label-in-left-top

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BlankWidget extends StatefulWidget {
  @override
  BlankWidgetState createState() => BlankWidgetState();

  Widget componentType;
  Widget? displayWidget;
  String? labelText;

  BlankWidget(
      {super.key,
      required this.componentType,
      this.displayWidget,
      this.labelText});
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
    print(widget.displayWidget);
    return Card(
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
        onPressed: () async {
          final value = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widget.componentType),
          );
          setState(() {});
        });
  }

  Widget _buildAddButton() {
    return IconButton(
        alignment: Alignment.bottomCenter,
        icon: const Icon(
          Icons.add,
          color: Color.fromRGBO(96, 103, 121, 1),
        ),
        onPressed: () async {
          final value = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widget.componentType),
          );
          setState(() {
            print("value: $value");
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
                color: Color.fromARGB(255, 131, 131, 131),
                blurRadius: 1.0,
                spreadRadius: 0.0,
                offset: Offset(0.0, 1.0),
              ),
            ],
            color: Color.fromARGB(255, 209, 209, 209),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ) // green shaped
            ),
        child: Text(widget.labelText as String),
      ),
    );
  }
}
