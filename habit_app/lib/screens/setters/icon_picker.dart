import 'package:flutter/material.dart';
import 'package:habit_app/all.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';

// ignore: must_be_immutable
class IconPicker extends StatefulWidget {
  late Habit habit;

  IconPicker({super.key, required this.habit});

  @override
  State<IconPicker> createState() => IconPickerState();
}

class IconPickerState extends State<IconPicker> {
  Icon? _icon;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _pickIcon();
    });
  }

  _pickIcon() async {
    IconData? icon = await FlutterIconPicker.showIconPicker(context,
        iconPackModes: [IconPack.cupertino]);

    _icon = Icon(icon);
    widget.habit.icon = _icon;
    setState(() {});

    debugPrint('Picked Icon:  $icon');
  }

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
                  child: Text('Pick an icon',
                      style: TextStyle(color: Colors.black))),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: _icon ?? Container(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _pickIcon,
                    child: const Text('Select New Icon'),
                  ),
                ],
              ),
            ),
            floatingActionButton: const MyApp().buildDoneButton(context)));
  }
}
