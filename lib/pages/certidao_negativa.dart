import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sefaz_exemplo/bloc/BlocCertidaoNegativa.dart';
import 'package:sefaz_exemplo/components/combobox.dart';
import 'package:mask_shifter/mask_shifter.dart';
import 'package:sefaz_exemplo/components/radio_group.dart';


class CertidaoPage extends StatefulWidget {
  @override
  _CertidaoPageState createState() => _CertidaoPageState();
}

class _CertidaoPageState extends State<CertidaoPage> {
  @override
  Widget build(BuildContext context) {

    final blocCertidao = Provider.of<BlocCertidaoNegativa>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Certidão Negativa",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                ComboBox(
                  label: "Dívida de",
                  callback: blocCertidao.setDisplayOptionDivida,
                  listItems: [
                    {"name": " ", "value": "0"},
                    {"name": "Item 1", "value": "1"},
                    {"name": "Item 2", "value": "2"},
                    {"name": "Item 3", "value": "3"},
                    {"name": "Item 4", "value": "4"},
                  ],
                  valor: blocCertidao.getDisplayOptionDivida
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    inputFormatters: [
                      MaskedTextInputFormatterShifter(
                          maskONE:"XXX.XXX.XXX-XX",
                          maskTWO:"XX.XXX.XXX/XXXX-XX"
                      ),
                    ],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "CPF/CPNJ",
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RadioGroup(
                    labels: ['Sim', 'Não'],
                    values: [0, 1],
                    radioCount: 2,
                    valueGroup: blocCertidao.getDisplayOptionEspolio,
                    callback: blocCertidao.setDisplayOptionEspolio,
                    title: "Para fim de espólio?",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ButtonTheme(
                    minWidth: 270.0,
                    height: 50.0,
                    buttonColor: Colors.black,
                    child: RaisedButton(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onPressed: ()=> {},
                      padding: EdgeInsets.all(12),
                      child: Text(
                        'Consultar',
                        style: TextStyle(
                            color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ButtonTheme(
                    minWidth: 270.0,
                    height: 50.0,
                    buttonColor: Colors.black,
                    child: RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onPressed: ()=> {},
                      padding: EdgeInsets.all(12),
                      child: Text(
                        'Limpar',
                        style: TextStyle(
                            color: Colors.black, fontSize: 18.0),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        )
    );
  }
}
