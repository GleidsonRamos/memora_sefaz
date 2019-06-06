import 'package:sefaz_exemplo/models/model_usuario.dart';

class SingletonAutenticacao {
  //Singleton
  SingletonAutenticacao._() {}
  static SingletonAutenticacao _instance = new SingletonAutenticacao._();
  static SingletonAutenticacao get instance => _instance;

  //Atributos
  String _password;
  Usuario _usuario;
  String _tokenUsuario;
  String _tokenSistema;
  //Get
  String get password => _password;
  Usuario get usuario => _usuario;
  String get tokenUsuario => _tokenUsuario;
  String get tokenSistema => _tokenSistema;

  void setPassword(String value) {
    _password = value;
  }

  void setUsuario(Usuario value){
    _usuario = value;
  }

  void setTokenUsuario(String value){
    _tokenUsuario = value;
  }

  void setTokenSistema(String value){
    _tokenSistema = value;
  }

}