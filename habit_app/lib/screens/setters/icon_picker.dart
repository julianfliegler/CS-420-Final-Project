import 'package:flutter/material.dart';
import 'package:habit_app/all.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';

class IconPicker extends StatefulWidget {
  const IconPicker({Key? key}) : super(key: key);

  @override
  State<IconPicker> createState() => IconPickerState();
}

class IconPickerState extends State<IconPicker> {
  Icon? _icon;

  _pickIcon() async {
    IconData? icon = await FlutterIconPicker.showIconPicker(context,
        iconPackModes: [IconPack.cupertino]);

    _icon = Icon(icon);
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
                  ElevatedButton(
                    onPressed: _pickIcon,
                    child: const Text('Open IconPicker'),
                  ),
                  const SizedBox(height: 10),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: _icon ?? Container(),
                  ),
                ],
              ),
            ),
            floatingActionButton: const MyApp().buildDoneButton(context)));
  }

  displayIcon() {
    return SizedBox(
      width: 120,
      child: _icon ?? Container(),
    );
  }
}
