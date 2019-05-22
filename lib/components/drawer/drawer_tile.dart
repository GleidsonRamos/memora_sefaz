import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sefaz_exemplo/bloc/BlocLogin.dart';
import 'package:sefaz_exemplo/pages/login.dart';

class DrawerTile extends StatelessWidget {
  final IconData _icon;
  final String _text;
  final String _route;

  DrawerTile(this._icon, this._text, this._route);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            if (this._route == "sair") {
              //Significa que clicou no botão sair
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Você realmente deseja sair ?"),
                      content:
                      Text("Você sera redirecionado para a tela de login."),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("Cancelar"),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        FlatButton(
                          child: Text("Sim"),
                          onPressed: () {
                            Navigator.pop(context);
                            //Chamar metodo para deslogar aqui
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChangeNotifierProvider<BlocLogin>(
                                      builder: (_) => BlocLogin(),
                                      child: LoginPage(),
                                    )));
                          },
                        ),
                      ],
                    );
                  });
            } else {
              Navigator.pushNamed(context, "/" + this._route);
            }
          },
          child: Container(
            padding: EdgeInsets.only(left: 10.0),
            height: 53.0,
            child: Row(
              children: <Widget>[
                Icon(
                  this._icon,
                  size: 28.0,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 32.0,
                ),
                Text(
                  this._text,
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
          ),
        ));
  }
}