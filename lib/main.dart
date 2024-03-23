import 'package:color_print/style/text.dart';
import 'package:flutter/material.dart';

import 'examples/colors/colors.dart';
import 'examples/design/input_decorations.dart';
import 'examples/validation/validation.dart';

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
                list(context)[index],
            separatorBuilder: (BuildContext context, int index) => Divider(),
            itemCount: list(context).length,
          ),
        ));
  }
}

List<Widget> list(BuildContext context) => [
      ListTile(
        leading: Icon(Icons.stars),
        title: Text('Color Print Examples'),
        onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => PrintColorFunctions())),
      ),
      ListTile(
        leading: Icon(Icons.stars),
        title: Text('Animation Examples'),
        // onTap: () => Navigator.of(context).push(
        //     MaterialPageRoute(builder: (context) => PrintColorFunctions())),
      ),
      ListTile(
        leading: Icon(Icons.stars),
        title: Text('InputDecoration Examples'),
        onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => MyInputDecorations())),
      ),
      ListTile(
        leading: Icon(Icons.stars),
        title: Text('Validation Examples'),
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ValidationPage())),
      ),
    ];
