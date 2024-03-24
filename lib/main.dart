import 'package:color_print/data.dart';
import 'package:color_print/style/text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/list_examples_screens.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<DataIs>(create: (_) => DataIs()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final _dataIs = Provider.of<DataIs>(context);
    return MaterialApp(
      title: 'MySelf Package Demo',
      debugShowCheckedModeBanner: false,
      theme: _dataIs.themeDataIs,
      themeMode: ThemeMode.dark,
      home: Scaffold(
        appBar: AppBar(
          title: Text("MySelf Package Demo"),
          actions: [
            Switch(
              value: _dataIs.themeIsDark,
              onChanged: (value) {
                _dataIs.changeTheme(value);
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
      ),
    );
  }
}
