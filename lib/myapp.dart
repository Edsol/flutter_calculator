import 'package:flutter/material.dart';
import 'package:myapp/numbergrid.dart';

// class MyHomePage extends StatelessWidget {
class MyHomePage extends StatefulWidget {
  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<MyHomePage> {
  String numbers_value = "22";

  String first_number = "0";

  Column _createColumn(List<Map> values) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: values.map(
        (element) => _createButton(element['view'],element['function'],element['argument'])
      ).toList()
    );
  }

  Widget _createButton(String number, Function() f,String arg) {
    return MaterialButton(
      height: 100.0,
      minWidth: 102.5,
      child: Text(number,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
      textColor: Colors.black,
      color: Colors.grey[100],
      onPressed: f,
    );
  }

  _addNumber(String new_char) {
    setState(() {
      numbers_value += new_char;
    });
  }

  _clear(String argument) {
    setState(() {
      numbers_value = '0';
    });
  }
  _zero() {}
  _disp() {}
  _div() {}


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Calcolatrice'),
        ),
        body: new Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Container(
                constraints: BoxConstraints.expand(
                  height: Theme.of(context).textTheme.display1.fontSize * 1.1 +
                      60.0,
                ),
                alignment: Alignment.bottomRight,
                color: Colors.white,
                child: Text(
                  numbers_value,
                  style: TextStyle(fontSize: 50, color: Colors.black),
                  textAlign: TextAlign.right,
                ),
              ),
              new Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _createColumn([{'view':'AC','function':_clear,'argument':'0'}]),
                  // _createColumn(["AC", "7", "4", "1", " "]),
                  // _createColumn(['C', "8", "5", "2", "0"]),
                  // _createColumn(["%", "9", "6", "3", "."]),
                  // _createColumn(["/", "X", "-", "+", "="]),
                ],
              )
            ],
          ),
        ));
  }
}
