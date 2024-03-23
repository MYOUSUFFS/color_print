import 'package:color_print/style/text.dart';
import 'package:flutter/material.dart';

import 'screens/list_examples_screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData theme = ThemeData.dark();
  ThemeMode? themeMode = ThemeMode.light;
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MySelf Package Demo',
        debugShowCheckedModeBanner: false,
        theme: theme,
        themeMode: themeMode,
        home: Scaffold(
          appBar: AppBar(
            title: Text("MySelf Package Demo"),
            actions: [
              Switch(
                value: _isSwitched,
                onChanged: (value) {
                  if (value) {
                    theme = ThemeData.dark();
                  } else {
                    theme = ThemeData.light();
                  }
                  _isSwitched = value;
                  setState(() {});
                },
              ),
              Text("Theme\nMode", style: MyText.heading.copyWith(fontSize: 14)),
              SizedBox(width: 10)
            ],
          ),
          body: ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) =>
                examples(context)[index],
            separatorBuilder: (BuildContext context, int index) => Divider(),
            itemCount: examples(context).length,
          ),
        ));
  }
}
