/// Example of an ordinal combo chart with two series rendered as bars, and a
/// third rendered as a line.
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart';
import 'package:charts_flutter/src/text_element.dart';
import 'package:charts_flutter/src/text_style.dart' as style;

class GraficoDespesasComFolha extends StatelessWidget {
  final List<Series> seriesList;
  final bool animate;

  GraficoDespesasComFolha(this.seriesList, {this.animate});

  factory GraficoDespesasComFolha.withSampleData() {
    return new GraficoDespesasComFolha(
      _createSampleData(),
      // Disable animations for image tests.
      animate: true,
    );
  }

  static List<OrdinalSales> inativos = [
    new OrdinalSales('Jan', 33),
    new OrdinalSales('Fev', 46),
    new OrdinalSales('Mar', 42),
    new OrdinalSales('Abr', 64),
    new OrdinalSales('Mai', 78),
    new OrdinalSales('Jun', 58),
  ];

  static List<OrdinalSales> ativos = [
    new OrdinalSales('Jan', 126),
    new OrdinalSales('Fev', 114),
    new OrdinalSales('Mar', 138),
    new OrdinalSales('Abr', 184),
    new OrdinalSales('Mai', 156),
    new OrdinalSales('Jun', 144),
  ];


  @override
  Widget build(BuildContext context) {

    SingletonInativos.instance.zerar();
    SingletonInativos.instance.setTotal(inativos);

    return new OrdinalComboChart(seriesList,
        animate: animate,
        primaryMeasureAxis: new NumericAxisSpec(
            tickProviderSpec:
            new BasicNumericTickProviderSpec(zeroBound: false,desiredMinTickCount: 4,desiredMaxTickCount: 10)),
        customSeriesRenderers: [
          new LineRendererConfig(
            // ID used to link series to this renderer.
            customRendererId: 'inativos',
            includePoints: true,
            includeArea: true,
            stacked: true,
            radiusPx: 4.0,
            includeLine: true,
            symbolRenderer: CustomCircleSymbolRendererInativos(list: inativos)
          ),
          new LineRendererConfig(
            // ID used to link series to this renderer.
            customRendererId: 'ativos',
            includePoints: true,
            includeArea: true,
            stacked: true,
            radiusPx: 4.0,
            includeLine: true,)
        ]);
  }




  /// Create series list with multiple series
  static List<Series<OrdinalSales, String>> _createSampleData() {
    return [
      new Series<OrdinalSales, String>(
          id: 'Inativos',
          colorFn: (_, __) => MaterialPalette.red.shadeDefault,
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: inativos,
      )
      // Configure our custom line renderer for this series.
        ..setAttribute(rendererIdKey, 'inativos'),

      new Series<OrdinalSales, String>(
          id: 'Ativos',
          colorFn: (_, __) => MaterialPalette.green.shadeDefault,
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: ativos)
      // Configure our custom line renderer for this series.
        ..setAttribute(rendererIdKey, 'ativos'),
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}

class CustomCircleSymbolRendererInativos extends CircleSymbolRenderer {

  List<OrdinalSales> list;
  CustomCircleSymbolRendererInativos({this.list});

  @override
  void paint(ChartCanvas canvas, Rectangle<num> bounds, {List<int> dashPattern, Color fillColor, Color strokeColor, double strokeWidthPx}) {

    super.paint(canvas, bounds, dashPattern: dashPattern, fillColor: fillColor, strokeColor: strokeColor, strokeWidthPx: strokeWidthPx);
    canvas.drawRect(
        Rectangle(bounds.left - 5, bounds.top - 30, bounds.width + 10, bounds.height + 10),
        fill: Color.white
    );
    var textStyle = style.TextStyle();
    textStyle.color = Color.black;
    textStyle.fontSize = 15;


      canvas.drawText(
          TextElement(
              list[SingletonInativos.instance.iterator].sales.toString(),
              style: textStyle),
          (bounds.left).round(),
          (bounds.top - 28).round()
      );
    SingletonInativos.instance.upIterator();
  }
}

class SingletonInativos {
  //Singleton
  SingletonInativos._() {}
  static SingletonInativos _instance = new SingletonInativos._();
  static SingletonInativos get instance => _instance;

  int _total = 0;
  int _iterator = 0;

  //Get
  int get total => _total;
  int get iterator => _iterator;

  void setTotal(List<dynamic> list){
    this._total = list.length;
    this._iterator = 0;
  }

  void upIterator(){
    if(this._iterator < this._total - 1){
      this._iterator++;
    }
    else{
      this._iterator = 0;
    }
  }

  void zerar(){
    this._total = 0;
    this._iterator = 0;
  }

}