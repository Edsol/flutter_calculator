import 'package:flutter/material.dart';

class MakeGrid extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return  new Row(
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
        // _createColumn(['C', "8", "5", "2", "0"]),
        // _createColumn(["%", "9", "6", "3", "."]),
        // _createColumn(["/", "X", "-", "+", "="]),
      ],
    );
  }
}