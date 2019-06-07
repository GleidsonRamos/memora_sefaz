import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sefaz_exemplo/bloc/BlocLogin.dart';
import 'package:sefaz_exemplo/components/http_client.dart';
import 'package:sefaz_exemplo/components/textbox.dart';
import 'package:sefaz_exemplo/enum/type_request.dart';
import 'package:sefaz_exemplo/models/model_autenticacao.dart';
import 'package:sefaz_exemplo/models/model_user.dart';
import 'package:sefaz_exemplo/models/model_usuario.dart';
import 'package:sefaz_exemplo/pages/home.dart';
import 'package:sefaz_exemplo/singleton/singleton_autenticacao.dart';
import 'package:sefaz_exemplo/store/url_store.dart';
import 'package:sefaz_exemplo/components/encrypt_decrypt.dart';
import 'dart:convert' as convert;

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _textUser = new TextEditingController();
  TextEditingController _textPass = new TextEditingController();

  Autenticacao autenticacao = new Autenticacao();
  Credentials credentials = new Credentials();
  Details details = new Details();

  @override
  void initState() {
    super.initState();
  }

  signIn() async {
    print('onpressed disparado');
    String User = _textUser.text;
    String Pass = await criptografia.criptografar(_textPass.text);

    SingletonAutenticacao.instance.setPassword(Pass); // Armazenando pass no singleton

    autenticacao.username = User;
    credentials.password = Pass;
    details.resourceApp = "EON";
    autenticacao.credentials = credentials;
    autenticacao.details = details;

    //LOGIN DO USUARIO

    final String url = UrlStore.getUrlLogin();//Aqui trocar pela url do usuario

    MyHttpClient httpClient = new MyHttpClient(
      url: url,
      type: TypeRequest.POST,
      body: autenticacao.toJson(),
      onSucess: onSucessLoginUsuario,//Retorno para login de usuario
      onFail: onFailLogin
    );

    httpClient.executar();
  }

  onSucessLoginUsuario(var response, var headers){

    Usuario usuario = new Usuario.fromJson(response);
    String tokenUsuario = headers['Authorization'];

    SingletonAutenticacao.instance.setTokenUsuario(tokenUsuario); // Armazenando token do usuario no singleton
    SingletonAutenticacao.instance.setUsuario(usuario); // Armazenando usuario no singleton

    //LOGIN DO SISTEMA


    //Confirmar os tipos dessas variaveis do usuario(Int e String?)
    autenticacao.details.usuarioHistorico = usuario.pessoaFisica.idPessoa.toString();
    autenticacao.username = "EON";
    autenticacao.details.resourceApp = "SFC";

    final String url = UrlStore.getUrlLogin(); //Aqui trocar pela url do sistema

    MyHttpClient httpClient = new MyHttpClient(
        url: url,
        type: TypeRequest.POST,
        body: autenticacao.toJson(),
        onSucess: onSucessLoginSistema,//Retorno para login de sistema
        onFail: onFailLogin
    );

    httpClient.executar();
  }

  onSucessLoginSistema(var response, var headers){
    String tokenSistema = headers['Authorization'];
    SingletonAutenticacao.instance.setTokenSistema(tokenSistema); // Armazenando token do sistema no singleton


    //Agora pode passar para a proxima tela, os tokens estaram sempre acessiveis
    //por meio do singleton nas outras telas,
    //podendo ser utilizados nos cabeçalhos das requisicoes que iram exigi-lo.
    //os dados do usuario tambem estaram acessiveis por meio do model de usuario no singleton :)
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage())
    );

  }

  onFailLogin(var response){
    //Fazer alguma coisa aqui, como mostrar uma mensagem de erro
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
