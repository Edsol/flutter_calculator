import 'package:flutter/material.dart';
import 'package:myapp/myapp.dart';


void main() => runApp(MyApp());
// void main() {
//   runApp(MyApp());
// }


class MyApp extends StatelessWidget {
  final appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      // theme: new ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}