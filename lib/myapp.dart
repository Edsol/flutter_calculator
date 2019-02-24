import 'package:flutter/material.dart';
import 'package:myapp/numbergrid.dart';

// class MyHomePage extends StatelessWidget {
class MyHomePage extends StatefulWidget {
  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<MyHomePage> {

  Widget _createButton(String number, Function() f) {
    return MaterialButton(
      height: 100.0,
      child: Text(number,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
      textColor: Colors.black,
      color: Colors.grey[100],
      onPressed: f,
    );
  }

  Column _createColumn(List<String> values){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: values.map((value) => _createButton(value,_clear)).toList()
    );
  }

  _clear() {}
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
                      100.0,
                ),
                alignment: Alignment.bottomRight,
                color: Colors.white,
                child: Text(
                  "1234",
                  style: TextStyle(fontSize: 50, color: Colors.black),
                  textAlign: TextAlign.right,
                ),
              ),
              _createColumn(["/","X","-","+","="]),
              // _createColumn(["/","X","-","+","="])
            ],
          ),
        ));
  }
}
