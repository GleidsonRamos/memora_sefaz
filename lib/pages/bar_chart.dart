/// Bar chart example
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart';
import 'dart:math';
import 'package:charts_flutter/src/text_element.dart';
import 'package:charts_flutter/src/text_style.dart' as style;

class GroupedBarTargetLineChart extends StatelessWidget {
  final List<Series> seriesList;
  final bool animate;

  GroupedBarTargetLineChart(this.seriesList, {this.animate});

  factory GroupedBarTargetLineChart.withSampleData() {
    return new GroupedBarTargetLineChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<List<OrdinalSales>> list = new List<List<OrdinalSales>>();
    list.add(desktopSalesData);
    list.add(tableSalesData);
    list.add(mobileSalesData);

    SingletonBarGrouped.instance.setTotal(list);

    return new BarChart(seriesList,
        animate: animate,
        barGroupingType: BarGroupingType.grouped,
        customSeriesRenderers: [
          new BarTargetLineRendererConfig<String>(
              // ID used to link series to this renderer.
              customRendererId: 'customTargetLine',
              symbolRenderer: CustomCircleSymbolRendererInativos(list: list),

              groupingType: BarGroupingType.grouped)
        ]);
  }

  static List<OrdinalSales> desktopSalesData = [
    new OrdinalSales('2014', 5),
    new OrdinalSales('2015', 25),
    new OrdinalSales('2016', 100),
    new OrdinalSales('2017', 75),
  ];

  static List<OrdinalSales> tableSalesData = [
    new OrdinalSales('2014', 25),
    new OrdinalSales('2015', 50),
    new OrdinalSales('2016', 10),
    new OrdinalSales('2017', 20),
  ];

  static List<OrdinalSales> mobileSalesData = [
    new OrdinalSales('2014', 10),
    new OrdinalSales('2015', 15),
    new OrdinalSales('2016', 50),
    new OrdinalSales('2017', 45),
  ];

  /// Create series list with multiple series
  static List<Series<OrdinalSales, String>> _createSampleData() {
    return [
      new Series<OrdinalSales, String>(
        id: 'Desktop',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesData,
      ),
      new Series<OrdinalSales, String>(
        id: 'Tablet',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tableSalesData,
      ),
      new Series<OrdinalSales, String>(
        id: 'Mobile',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: mobileSalesData,
      ),
      new Series<OrdinalSales, String>(
        id: 'Desktop Target Line',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesData,
      )
        // Configure our custom bar target renderer for this series.
        ..setAttribute(rendererIdKey, 'customTargetLine'),
      new Series<OrdinalSales, String>(
        id: 'Tablet Target Line',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tableSalesData,
      )
        // Configure our custom bar target renderer for this series.
        ..setAttribute(rendererIdKey, 'customTargetLine'),
      new Series<OrdinalSales, String>(
        id: 'Mobile Target Line',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: mobileSalesData,
      )
        // Configure our custom bar target renderer for this series.
        ..setAttribute(rendererIdKey, 'customTargetLine'),
    ];
  }
}

class CustomCircleSymbolRendererInativos extends CircleSymbolRenderer {
  List<List<OrdinalSales>> list;
  CustomCircleSymbolRendererInativos({this.list});

  @override
  void paint(ChartCanvas canvas, Rectangle<num> bounds,
      {List<int> dashPattern,
      Color fillColor,
      Color strokeColor,
      double strokeWidthPx}) {
/*
    super.paint(canvas, bounds,
        dashPattern: dashPattern,
        fillColor: fillColor,
        strokeColor: strokeColor,
        strokeWidthPx: strokeWidthPx);

    canvas.drawRect(
        Rectangle(bounds.left - 5, bounds.top - 30, bounds.width + 10,
            bounds.height + 10),
        fill: Color.white);

    */
    var textStyle = style.TextStyle();
    textStyle.color = Color.black;
    textStyle.fontSize = 15;
    List<OrdinalSales> lista = this.list[SingletonBarGrouped.instance._iteratorList];
    String text = lista[SingletonBarGrouped.instance._iterator].sales.toString();
    canvas.drawText(
        TextElement(text,style: textStyle),
        (bounds.left).round(),
        (bounds.top - 28).round());
    SingletonBarGrouped.instance.upIterator();
  }
}

class SingletonBarGrouped {
  //Singleton
  SingletonBarGrouped._() {}
  static SingletonBarGrouped _instance = new SingletonBarGrouped._();
  static SingletonBarGrouped get instance => _instance;

  //Atributos
  int _total = 0;
  int _totalList = 0;
  int _iterator = 0;
  int _iteratorList = 0;

  //Get
  int get total => _total;
  int get iterator => _iterator;
  int get iteratorList => _iteratorList;
  int get totalList => _totalList;

  void setTotal(List<List<dynamic>> list) {
    this._total = list[0].length;
    this._totalList = list.length;
    this._iterator = 0;
    this._iteratorList = 0;
  }

  void upIterator() {

    bool upList = false;
    if (this._iterator < this._total - 1) {
      this._iterator++;
    }
    else{
      upList = true;
      this._iterator = 0;
    }
    if(upList){
      if(this._iteratorList < this._totalList - 1){
        this._iteratorList++;
      }
      else{
        this._iteratorList = 0;
      }
    }


//
//      if (this._iteratorList < this._totalList) {
//      if (this._iterator < this._total - 1) {
//        this._iterator++;
//      } else {
//        this._iteratorList++;
//        this._iterator = 0;
//        if(!(this._iteratorList < this._totalList)){
//          this._iteratorList = 0;
//          this._iterator = 0;
//        }
//      }
//    } else {
//      this._iteratorList = 0;
//      this._iterator = 0;
//    }
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
