import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sefaz_exemplo/bloc/BlocLogin.dart';
import 'package:sefaz_exemplo/components/textbox.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  void initState() {
    super.initState();
  }

  signIn(String User, String Senha) {




    /*
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Home())
    );
    */
  }

  TextEditingController _textUser = new TextEditingController();
  TextEditingController _textPass = new TextEditingController();


  @override
  Widget build(BuildContext context) {

    //REFERENCIA E CHAMADA A CLASSE BLOCLOGIN AQUI
    final blocLogin = Provider.of<BlocLogin>(context);

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Material(
                child: Column(
                  children: <Widget>[
                    //Utilizando o componente textbox para textos em geral (Exceto senha)
                    Textbox(
                      label: "Matricula",
                      callback: blocLogin.setDisplayUser,
                      controller: _textUser,
                    ),
                    //Esse é um exemplo de textField para senha:
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Senha",
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onChanged: blocLogin.setDisplayPass,
                        controller: _textPass,
                      ),
                    ),
                    ButtonTheme(
                      minWidth: 270.0,
                      height: 50.0,
                      buttonColor: Colors.black,
                      child: RaisedButton(
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onPressed: signIn(blocLogin.getDisplayUser, blocLogin.getDisplayPass),
                        padding: EdgeInsets.all(12),
                        child: Text(
                          'Entrar',
                          style: TextStyle(
                              color: Colors.white, fontSize: 18.0),
                        ),
                      ),
                    ),
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
