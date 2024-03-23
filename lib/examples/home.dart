import 'package:flutter/material.dart';

import 'colors/colors.dart';
import 'design/input_decorations.dart';
import 'validation/validation.dart';

class ExamplesList extends StatelessWidget {
  ExamplesList({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MySelf Package Demo")),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) => list(context)[index],
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemCount: list(context).length,
      ),
    );
  }
}
