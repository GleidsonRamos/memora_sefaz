import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sefaz_exemplo/bloc/BlocCertidaoNegativa.dart';
import 'package:sefaz_exemplo/components/drawer/drawer.dart';
import 'package:sefaz_exemplo/pages/certidao_negativa.dart';
import 'package:sefaz_exemplo/pages/grafico_despesas_com_folha.dart';
import 'package:charts_flutter/flutter.dart' as charts;


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Bem Vindo",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        drawer: CustomDrawer(),
        body: Container(
          child: GraficoDespesasComFolha(_createSampleData()),
        )
        );
  }


  void openCertidao(){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider<BlocCertidaoNegativa>(
              builder: (_) => BlocCertidaoNegativa(),
              child: CertidaoPage(),
            )));
  }

  static List<charts.Series<OrdinalSales, String>> _createSampleData() {

    final inativos = [
      new OrdinalSales('Jan', 33),
      new OrdinalSales('Fev', 46),
      new OrdinalSales('Mar', 42),
      new OrdinalSales('Abr', 64),
      new OrdinalSales('Mai', 78),
      new OrdinalSales('Jun', 58),
    ];

    final ativos = [
      new OrdinalSales('Jan', 126),
      new OrdinalSales('Fev', 114),
      new OrdinalSales('Mar', 138),
      new OrdinalSales('Abr', 184),
      new OrdinalSales('Mai', 156),
      new OrdinalSales('Jun', 144),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Inativos',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: inativos,
      )
      // Configure our custom line renderer for this series.
        ..setAttribute(charts.rendererIdKey, 'inativos'),

      new charts.Series<OrdinalSales, String>(
          id: 'Ativos',
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: ativos)
      // Configure our custom line renderer for this series.
        ..setAttribute(charts.rendererIdKey, 'ativos'),
    ];
  }
}
