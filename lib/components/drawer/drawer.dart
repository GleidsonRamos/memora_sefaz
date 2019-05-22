import 'package:flutter/material.dart';
import 'package:sefaz_exemplo/components/drawer/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          ListView(
            padding: EdgeInsets.only(left: 0.0, top: 0.0),
            children: <Widget>[
              Container(
                  color: Colors.black,
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 8.0),
                  padding: EdgeInsets.only(
                      left: 0.0, top: 0.0, right: 1.0, bottom: 8.0),
                  height: 190.0,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                          top: 40.0,
                          left: 20.0,
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                top: 25,
                                left: 25,
                                child: Container(
                                  width: 30.0,
                                  height: 30.0,
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: CircularProgressIndicator(
                                      valueColor:
                                      new AlwaysStoppedAnimation<Color>(
                                          Colors.white)),
                                ),
                              ),
                              Container(
                                  width: 85.0,
                                  height: 85.0,
                                  decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: new DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              "assets/image_user_default.png")))),
                            ],
                          )),
                      Positioned(
                        top: 140.0,
                        left: 20.0,
                        child: Text(
                          "Nome do Usuario",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 160.0,
                        left: 20.0,
                        child: Text(
                          "Bem vindo ao Sefaz ",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  )),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Column(
                  children: <Widget>[
                    DrawerTile(Icons.person, "Perfil", "profile"),
                    DrawerTile(Icons.help, "Ajuda", "profile"),
                    this._separator("Comunicados"),
                    DrawerTile(Icons.link, "Links", "profile"),
                    DrawerTile(Icons.gavel, "Legal", "profile"),
                    this._separator("Configurações"),
                    DrawerTile(Icons.exit_to_app, "Sair", "sair"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _separator(String text){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 5.0,),
        Container(
          color: Colors.grey[400],
          height: 1.0,
        ),
        SizedBox(height: 10.0,),
        Container(
          padding: EdgeInsets.only(left: 10.0),
          child: Text(
            text,
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.black
            ),
          ),
        ),
        SizedBox(height: 10.0,),
      ],
    );
  }
}

