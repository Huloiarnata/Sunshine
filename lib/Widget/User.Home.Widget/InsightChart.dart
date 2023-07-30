import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../Services/AreaInsights/DataOperations.dart';
import 'AreaInsight.widget.dart';
class SPLineCharts extends StatelessWidget {
  const SPLineCharts({
    super.key,
    required TrackballBehavior trackballBehavior,
    required this.widget,
    required this.meteorologicalData,
    required this.title,
  }) : _trackballBehavior = trackballBehavior;

  final TrackballBehavior _trackballBehavior;
  final AreaInsight widget;
  final List<Content> meteorologicalData;
  final title;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      borderColor: Colors.transparent,
      plotAreaBorderWidth: 0,
      borderWidth: 3,
      trackballBehavior: _trackballBehavior,
      title: ChartTitle(
          text: title,
          alignment: ChartAlignment.near,
          borderWidth: 0,
          textStyle: TextStyle(
            color: Colors.black, // Customize the color of the category labels
            fontSize: widget.height*0.015, // Customize the font size of the category labels
            fontWeight: FontWeight.w500,
          )),
      primaryYAxis: NumericAxis(
        //isVisible: false,
        //title: AxisTitle(text: 'Y-axis Title'),
        opposedPosition: true,
        axisBorderType: AxisBorderType.withoutTopAndBottom,
        majorGridLines: const MajorGridLines(color: Colors.transparent),
        minorGridLines: const MinorGridLines(color: Colors.grey),
      ),
      primaryXAxis: CategoryAxis(
        //labelPlacement: LabelPlacement.onTicks,

        labelStyle: TextStyle(
          color: Colors.black, // Customize the color of the category labels
          fontSize: widget.height*0.013, // Customize the font size of the category labels
          fontWeight: FontWeight.bold, // Customize the font weight of the category labels
        ),
        majorGridLines: const MajorGridLines(color: Colors.transparent),
        minorGridLines: const MinorGridLines(color: Colors.transparent),

      ),
      zoomPanBehavior: ZoomPanBehavior(
          enableDoubleTapZooming: true,
          enablePanning: true,
          zoomMode: ZoomMode.x
          
      ),
      // Adjust the percentage as needed


      series: <ChartSeries>[

        SplineAreaSeries<Content,String>(
          borderWidth: 1,
          borderColor:Colors.greenAccent,
          dataSource: meteorologicalData.sublist(0,6),
          xValueMapper: (Content content,_)=> content.month,
          yValueMapper: (Content content,_)=> content.value,
          gradient: LinearGradient(
            colors: [
              const Color(0xFF65D46E).withOpacity(0.8),
              Colors.greenAccent.withOpacity(0.4),
              Colors.white
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),

        ),
      ],
      indicators: <TechnicalIndicators>[
        AtrIndicator<TechnicalIndicators, String>(
          seriesName: 'SplineAreaSeries',
          // Add ATR indicator properties here
        ),
      ],
    );
  }
}



