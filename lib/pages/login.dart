import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sefaz_exemplo/bloc/BlocLogin.dart';
import 'package:sefaz_exemplo/components/http_client.dart';
import 'package:sefaz_exemplo/components/textbox.dart';
import 'package:sefaz_exemplo/enum/type_request.dart';
import 'package:sefaz_exemplo/models/model_user.dart';
import 'package:sefaz_exemplo/pages/home.dart';
import 'package:sefaz_exemplo/store/url_store.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _textUser = new TextEditingController();
  TextEditingController _textPass = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }


  onSucessLogin(var response){
    //Fazer alguma coisa aqui, como passar para proxima tela
  }

  onFailLogin(var response){
    //Fazer alguma coisa aqui, como mostrar uma mensagem de erro
  }

  signIn() {
    print('onpressed disparado');
    String User = _textUser.text;
    String Pass = _textPass.text;

    ModelUser modelUser = new ModelUser(user: User, pass: Pass);
    //TODO: O codigo comentado abaixo é o uso do http_client para quando estiver implementado a conexao com o servidor. Veja mais na classe components/http_client.dart
    /*
    final String url = UrlStore.getUrlLogin();

    MyHttpClient httpClient = new MyHttpClient(
      url: url,
      type: TypeRequest.POST,
      body: modelUser.toJson(),
      onSucess: onSucessLogin,
      onFail: onSucessLogin
    );

    httpClient.executar();

    */

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage())
    );

  }

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
                        onPressed: ()=> signIn(),
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
