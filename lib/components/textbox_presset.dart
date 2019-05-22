import 'package:flutter/material.dart';
//Text Box

class TextboxPresset extends StatelessWidget {
  String label;
  String pressetValue;
  Function callback;
  var controller;

  TextboxPresset({this.label, this.callback, this.pressetValue});

  var _txtPresset = new TextEditingController();

  _testPresset(){
    if(pressetValue != null && pressetValue != ""){
      _txtPresset.text = pressetValue;
    }
  }

  @override
  Widget build(BuildContext context) {

    _testPresset();

    return new FocusScope(node: new FocusScopeNode(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _txtPresset,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: this.label,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
            ),
            onChanged: (text) {
              if(text != null){
                if(callback != null){
                  callback(text);
                }
              }
            },
          ),
        )
    );
  }
}