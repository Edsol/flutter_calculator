import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  String bodyText = "Page";

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
    @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Calcolatrice'),
      ),
      body: new Container(
        child: new ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("1"),
              Text('2'),
              Text("3")
            ]
            )
          ],
        ),
      )
      // Row(
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     Expanded(
      //       child: Text("1"),
      //     ),
      //     Expanded(
      //       child: Text("2"),
      //     ),
      //     Expanded(
      //       child: Text("3"),
      //     ),
      //   ],
      // ),
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   children: [
      //     Text("1"),
      //     Text('2'),
      //     Text("3")
      //   ],
      // ),
    );
  }
}