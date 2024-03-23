import 'package:colorful_print/colorful_print.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

printNewFormat(String text, int r, int g, int b) {
  int codeColor = 16 + (36 * (r ~/ 51)) + (6 * (g ~/ 51)) + (b ~/ 51);
  print(codeColor);

  return debugPrint("\x1B[38;5;${codeColor}m$text\x1B[0m");
}

printHexCodeNew(String text, String hexCode) {
  Map<String, int> rgbValues = hexToRgb(hexCode);
  int codeColor = 16 +
      (36 * (rgbValues['r']! ~/ 51)) +
      (6 * (rgbValues['g']! ~/ 51)) +
      (rgbValues['b']! ~/ 51);
  return debugPrint("\x1B[38;5;${codeColor}m$text\x1B[0m");
}

Map<String, int> hexToRgb(String hexColorCode) {
  String hex = hexColorCode.replaceAll("#", "");
  if (hex.length != 6) {
    throw const FormatException("Invalid hexadecimal color code");
  }

  int r = int.parse(hex.substring(0, 2), radix: 16);
  int g = int.parse(hex.substring(2, 4), radix: 16);
  int b = int.parse(hex.substring(4, 6), radix: 16);

  return {'r': r, 'g': g, 'b': b};
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    printNewFormat("Hello", 68, 153, 85);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            Text("Center"),
            TextFormField(
            ),
            ElevatedButton(
                onPressed: () {
                  printColor("Hello World New!  ",textColor: TextColor.black, backgroundColor: BackGroundColor.purple);
                  print('\x1B[33mtext\x1B[0m');
                },
                child: Text("Click to print color"))
          ],
        )),
      ),
    );
  }
}
