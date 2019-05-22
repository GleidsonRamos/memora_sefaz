import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

//Text Box

class FotoUpload extends StatelessWidget {
  String titulo;
  Function callback;
  String foto;

  var BASE64 = const Base64Codec();

  FotoUpload({this.titulo, this.foto, this.callback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            ListTile(
              title: Text('Enviar Foto',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text(titulo),
              leading: Icon(
                Icons.photo_camera,
                color: Colors.blue[500],
              ),
            ),
            Center(
              child: foto == null
                  ? new Text("")
                  : new Image.memory(BASE64.decode(foto), height: 200.0),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                onPressed: callback,
                color: Colors.white,
                textColor: Theme.of(context).primaryColor,
                padding: EdgeInsets.all(8.0),
                child: Column(
                  // Replace with a Row for horizontal icon + text
                  children: <Widget>[
                    Icon(Icons.add_a_photo),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Tirar Nova Foto"),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}