import 'package:color_print/examples/colors/colors.dart';
import 'package:flutter/material.dart';

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
          // onTap: () => Navigator.of(context).push(
          //     MaterialPageRoute(builder: (context) => PrintColorFunctions())),
        ),
        ListTile(
          leading: Icon(Icons.stars),
          title: Text('Validation Examples'),
          // onTap: () => Navigator.of(context).push(
          //     MaterialPageRoute(builder: (context) => PrintColorFunctions())),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MySelf Package Examples")),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) => list(context)[index],
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemCount: list(context).length,
      ),
    );
  }
}
