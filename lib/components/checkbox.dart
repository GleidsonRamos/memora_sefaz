import 'package:flutter/material.dart';

//Text Box

class CheckBox extends StatelessWidget {
  String label;
  Function callback;
  bool initialState;

  CheckBox({this.label, this.initialState, this.callback});

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Checkbox(
          onChanged: (bool Selected) {
            if(callback != null){
              callback(Selected);
            }
          },
          activeColor: Theme.of(context).primaryColor,
          value: initialState,
        ),
        Text(label)
      ],
    );
  }

}