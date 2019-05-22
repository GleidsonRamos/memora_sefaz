import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sefaz_exemplo/models/model_user.dart';

class UserService {
  
  //Singleton
  UserService._() {}
  static UserService _instance = new UserService._();
  static UserService get instance => _instance;

  //Atributos
  ModelUser _userData = new ModelUser();
  bool _isLoading = false;

  //Get
  bool get isLoading => _isLoading;
  ModelUser get userData => _userData;

  void signIn(
      {@required String user,
        @required String pass}) async {
    _isLoading = true;

    
    //Metodo para logar


    //Salvar os dados no singleton

  }

}
