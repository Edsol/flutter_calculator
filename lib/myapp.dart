import 'package:flutter/material.dart';
import 'dart:math';
// import 'package:myapp/makeGrid.dart';

// class MyHomePage extends StatelessWidget {
class MyHomePage extends StatefulWidget {
  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<MyHomePage> {
  String numberValue = "0";

  String firstNumber = '';
  String secondNumber = '';
  String signValue = '';

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

  _add(String newValue){
    if(numberValue != '0' || newValue == ','){
      newValue = numberValue + newValue;
    }
    _setNumberValue(newValue);
  }

  _clear(String newValue) {
    _eraseNumberValues();
    _setNumberValue('');
  }

 _eraseNumberValues(){
    firstNumber = '';
    secondNumber = '';
    signValue = '';
 }
  _backspace(String val){
    _setNumberValue(numberValue.substring(0,numberValue.length-1));
  }
  _setNumberValue(String newValue){
    setState(() {
      numberValue = newValue;
    });
  }

  bool isNumeric(String s) {
    if(s == null) {
      return false;
    }
    return double.parse(s, (e) => null) != null;
  }

  _doTheCalc(){
    double result;
    if(isNumeric(firstNumber) && isNumeric(secondNumber) && signValue != ''){
      double val1 = double.parse(firstNumber);
      double val2 = double.parse(secondNumber);
      switch (signValue) {
        case '+':
          result = val1 + val2;
          break;
        case '-':
          result = val1 - val2;
          break;
        case 'x':
          result = val1 * val2;
          break;
        case '÷':
          result = val1 / val2;
          break;
      }
      _writeResult(result);
      
    }else{
      print("i dati passati non sono numeri");
    }
  }

  _writeResult(double result){
    int resultInt = result.toInt();
    if(resultInt == result){
      _setNumberValue(resultInt.toString());
    }else{
      _setNumberValue(result.toString());
    }
    _eraseNumberValues();
    // print("firstnumber" + firstNumber);
    // print("secondnumber" + secondNumber);
  }

  _radic(String sign){
    var rad = sqrt(double.parse(numberValue));
    _setNumberValue(rad.toStringAsFixed(4));
    print(rad);
  }
  
  _sign(String sign){
    print('SIGN = ' + sign);
    if(sign == '='){
      secondNumber = numberValue;
      _doTheCalc();
    }else if(sign == '+' || sign == '-' || sign == 'x' || sign == '÷' ){
      firstNumber = numberValue;
      numberValue = '';
      signValue = sign;
      _setNumberValue('0');
    }
  }

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
                    {'view':'AC','function':_clear,'argument':'AC'},
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
                    {'view':'√','function':_radic,'argument':'√'},
                    {'view':'9','function':_add,'argument':'9'},
                    {'view':'6','function':_add,'argument':'6'},
                    {'view':'3','function':_add,'argument':'3'},
                    {'view':'.','function':_add,'argument':'.'},
                  ]),
                  _createColumn([
                    {'view':'÷','function':_sign,'argument':'÷'},
                    {'view':'x','function':_sign,'argument':'x'},
                    {'view':'-','function':_sign,'argument':'-'},
                    {'view':'+','function':_sign,'argument':'+'},
                    {'view':'=','function':_sign,'argument':'='},
                  ]),
                ],
              )
            ],
          ),
        ));
  }
}
