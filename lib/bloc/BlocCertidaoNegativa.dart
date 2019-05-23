import 'package:flutter/material.dart';

class BlocCertidaoNegativa with ChangeNotifier{

  BlocCertidaoNegativa();

  String _displayOptionDivida = "0";
  int _displayOptionEspolio = 0;
  String _cpfcnpj = "";

  void setDisplayOptionDivida(String _textValue){
    _displayOptionDivida = _textValue;
    notifyListeners();
  }

  void setDisplayOptionEspolio(int _textValue){
    _displayOptionEspolio = _textValue;
    notifyListeners();
  }

  void setDisplayCpfCnpj(String _textValue){
    _cpfcnpj = _textValue;
    notifyListeners();
  }

  String get getDisplayOptionDivida => _displayOptionDivida;
  int get getDisplayOptionEspolio => _displayOptionEspolio;
  String get getDisplayCpfCnpj => _cpfcnpj;
}