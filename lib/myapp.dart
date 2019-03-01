import 'package:flutter/material.dart';
// import 'package:myapp/makeGrid.dart';

// class MyHomePage extends StatelessWidget {
class MyHomePage extends StatefulWidget {
  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<MyHomePage> {
  String numberValue = "22";

  String firstVumber = "0";

  Column _createColumn(List<Map> values) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: values.map(
        (element) => _createButton(element['view'],element['function'],element['argument'])
      ).toList()
    );
  }

  Widget _createButton(String number, Function(String) func,String argument) {
    return MaterialButton(
      height: 100.0,
      minWidth: 102.5,
      child: Text(number,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
      textColor: Colors.black,
      color: Colors.grey[100],
      onPressed: () => func(argument),
    );
  }

  // _addNumber(String new_char) {
  //   setState(() {
  //     numbers_value += new_char;
  //   });
  // }
  _add(String newValue){
    if(numberValue != '0'){
      newValue = numberValue + newValue;
    }
    setState(() {
      numberValue = newValue;
    });
  }

  _clear(String newValue) {
    setState(() {
      numberValue = newValue;
    });
  }
  _backspace(String val){
    setState(() {
      numberValue = numberValue.substring(0,numberValue.length-1);
    });
  }
  // _zero() {}
  // _disp() {}
  // _div() {}


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
                  numberValue,
                  style: TextStyle(fontSize: 50, color: Colors.black),
                  textAlign: TextAlign.right,
                ),
              ),
              new Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _createColumn([
                    {'view':'AC','function':_clear,'argument':'0'},
                    {'view':'7','function':_add,'argument':'7'},
                    {'view':'4','function':_add,'argument':'4'},
                    {'view':'1','function':_add,'argument':'1'},
                    {'view':' ','function':_add,'argument':''},
                  ]),
                  _createColumn([
                    {'view':'C','function':_backspace,'argument':''},
                    {'view':'8','function':_add,'argument':'8'},
                    {'view':'5','function':_add,'argument':'5'},
                    {'view':'2','function':_add,'argument':'2'},
                    {'view':'0','function':_add,'argument':'0'},
                  ]),
                  _createColumn([
                    {'view':'%','function':_backspace,'argument':''},
                    {'view':'9','function':_add,'argument':'9'},
                    {'view':'6','function':_add,'argument':'6'},
                    {'view':'3','function':_add,'argument':'3'},
                    {'view':'.','function':_add,'argument':'.'},
                  ]),
                  _createColumn([
                    {'view':'/','function':_backspace,'argument':'/'},
                    {'view':'X','function':_add,'argument':'X'},
                    {'view':'-','function':_add,'argument':'-'},
                    {'view':'+','function':_add,'argument':'+'},
                    {'view':'=','function':_add,'argument':'='},
                  ]),
                  // _createColumn(["/", "X", "-", "+", "="]),
                ],
              )
            ],
          ),
        ));
  }
}
