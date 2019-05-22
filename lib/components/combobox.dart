import 'package:flutter/material.dart';

//ComboBox

class ComboBox extends StatelessWidget {
  String label;
  Function callback;
  String valor;
  //List<String> listItems = [];

  List<Map<String, String>> listItems = [];

  ComboBox({this.label, this.callback, this.valor, this.listItems});

  String contruirString(value, text){
    if(value != "0" && value != 0){
      return value + " - " + text;
    }
    else{
      return "   ";
    }
  }

  @override
  Widget build(BuildContext context) {



    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new FormField(
        builder: (FormFieldState state) {
          return InputDecorator(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: label,
            ),
            isEmpty: valor == '',
            child: new DropdownButtonHideUnderline(
              child: new DropdownButton<String>(
                items: listItems.map((Map item) {
                  return new DropdownMenuItem<String>(
                    value: item['value'],
                    child: new Text(contruirString(item['value'] , item['name'])),
                  );
                }).toList(),
                value: valor,
                isDense: true,
                onChanged: (String value) {
                  callback(value);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}