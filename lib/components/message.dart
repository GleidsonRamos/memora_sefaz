import 'package:flutter/material.dart';

enum DialogAction {
  cancel,
  discard,
  disagree,
  agree,
  confirm,
}

class Messages {
  /// ****************SINGLETON SERVICE***********/

  Messages._();

  static Messages _instance = new Messages._();

  /// Gets the instance of service .
  static Messages get instance => _instance;

  /// ****************END SINGLETON SERVICE***********/


  Future<Widget> showMensagem(String msg, BuildContext context) {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Saneago'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                new Text(msg),
              ],
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text('Ok, entendi.'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}