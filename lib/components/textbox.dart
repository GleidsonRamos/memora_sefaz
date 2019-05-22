import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//Text Box

class Textbox extends StatelessWidget {
  String label;
  var inputType;
  Function callback;
  var controller;
  var focusNode;
  TextInputFormatter inputFormatter;

  Textbox({this.label, this.callback, this.inputType, this.controller, this.inputFormatter, this.focusNode});

  @override
  Widget build(BuildContext context) {

    if(inputType == null){
      inputType = TextInputType.text;
    }
    if(inputType == TextInputType.multiline){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          focusNode: focusNode,
          keyboardType: inputType,
          maxLines: 5,
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: this.label,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
          ),
          onChanged: (text) {
            if (text != null) {
              if (callback != null) {
                callback(text);
              }
            }
          },
        ),
      );
    }

    if(inputFormatter != null){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          focusNode: focusNode,
          keyboardType: inputType,
          inputFormatters: [
            inputFormatter,
          ],
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: this.label,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
          ),
          onChanged: (text) {
            if (text != null) {
              if (callback != null) {
                callback(text);
              }
            }
          },
        ),
      );
    }

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          focusNode: focusNode,
          keyboardType: inputType,
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: this.label,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
          ),
          onChanged: (text) {
            if (text != null) {
              if (callback != null) {
                callback(text);
              }
            }
          },
        ),
      );

  }
}
