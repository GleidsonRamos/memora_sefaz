import 'package:flutter/material.dart';

class BlocLogin with ChangeNotifier{

  BlocLogin();

  String _displayUser;
  String _displayPass;

  void setDisplayUser(String _textUser){
    _displayUser = _textUser;
    notifyListeners();
  }

  void setDisplayPass(String _textPass){
    _displayPass = _textPass;
    notifyListeners();
  }

  String get getDisplayUser => _displayUser;
  String get getDisplayPass => _displayPass;

}