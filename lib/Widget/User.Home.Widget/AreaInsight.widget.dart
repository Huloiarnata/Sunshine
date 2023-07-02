import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:sunshine/Widget/Assets.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/src/painting/gradient.dart' as flutter_gradient;


class AreaInsight extends StatefulWidget {
  const AreaInsight({
    super.key,
    required this.width,
    required this.height,
    required this.heightFactor,
    required this.widthFactor,
  });

  final double width;
  final double height;
  final double heightFactor;
  final double widthFactor;

  @override
  State<AreaInsight> createState() => _AreaInsightState();
}

class _AreaInsightState extends State<AreaInsight> {


  Future<String> fetchInsightData()async{
    const String nasaPowerUrl = 'https://power.larc.nasa.gov/api/temporal/monthly/point?parameters=ALLSKY_SRF_ALB,CLRSKY_SFC_SW_DWN,ALLSKY_SFC_SW_DWN,T2M,PRECTOTCORR,WD50M,WS50M&community=RE&longitude=73.6915&latitude=24.5854&format=JSON&start=2020&end=2020';
    final insightResponse =await http.get(Uri.parse(nasaPowerUrl));
    return insightResponse.body;
  }
  String _getMonthAbbreviation(int month) {
    return [
      '',
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ][month];
  }
  // List of T2M data objects
  List<T2M> t2mDataObjects = [];
  late TrackballBehavior _trackballBehavior;
  @override
  void initState(){
    _trackballBehavior = TrackballBehavior(
        enable: true,
        markerSettings: const TrackballMarkerSettings(markerVisibility: TrackballVisibilityMode.visible),
      activationMode: ActivationMode.singleTap,
      tooltipSettings: const InteractiveTooltip(
        enable: true,
        format: 'point.y °C'
      )
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
      Container(
          height: widget.height*0.36,
          width: MediaQuery.sizeOf(context).width,
          margin: EdgeInsets.all(widget.width*0.05),

        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(20), // Adjust the radius value to change the roundness
        ),
          child: FutureBuilder(
              future: fetchInsightData(),
              builder: (context,snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[

                  SizedBox(height: widget.width*0.25,
                      child: const RiveAnimation.asset(AssetsPath.loading)),
                        Text("Loading",style: TextStyle(
                          color: Colors.black, // Customize the color of the category labels
                          fontSize: widget.height*0.016, // Customize the font size of the category labels
                          fontWeight: FontWeight.w300, // Customize the font weight of the category labels
                        ),)

                ]);
                }else if (snapshot.hasData) {
                  String data = snapshot.data??'';
                  Map<String, dynamic> insightData = json.decode(data);
                  Map<String,dynamic> t2mData = insightData['properties']['parameter']['T2M'];
                  //Type casting map
                  Map<String, double> castedMap = {};//empty map

                  t2mData.forEach((key, value) {
                    castedMap[key] = value.toDouble();
                  });
                  Map<String, double> updatedMap = {};

                  castedMap.forEach((key, value) {
                    DateTime date = DateTime.parse('${key.substring(0, 6)}01');
                    String formattedKey = "${_getMonthAbbreviation(date.month)}'${date.year.toString().substring(2)}";
                    updatedMap[formattedKey] = value;
                  });

                  //print(updatedMap);

                  updatedMap.forEach((month, temperature) {
                    t2mDataObjects.add(T2M(month,temperature));
                  }
                  );
                  return
                    SfCartesianChart(
                    borderColor: Colors.transparent,
                    plotAreaBorderWidth: 0,
                    borderWidth: 3,
                    trackballBehavior: _trackballBehavior,
                    title: ChartTitle(
                        text: "     Temperature at 2m",
                        alignment: ChartAlignment.near,
                        borderWidth: 0,
                        textStyle: TextStyle(
                          color: Colors.black, // Customize the color of the category labels
                          fontSize: widget.height*0.015, // Customize the font size of the category labels
                          fontWeight: FontWeight.w400,
                    )),
                    primaryYAxis: NumericAxis(
                      isVisible: false,
                      axisBorderType: AxisBorderType.withoutTopAndBottom,
                      majorGridLines: const MajorGridLines(color: Colors.transparent),
                      minorGridLines: const MinorGridLines(color: Colors.transparent),
                    ),
                    primaryXAxis: CategoryAxis(

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
                      SplineAreaSeries<T2M,String>(
                        borderWidth: 1,
                        borderColor:Colors.greenAccent,
                        dataSource: t2mDataObjects.sublist(0,6),
                        xValueMapper: (T2M content,_)=> content.month,
                        yValueMapper: (T2M content,_)=> content.temp,
                        gradient: flutter_gradient.LinearGradient(
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

                } else {
                  return Text('Error occurred: ${snapshot.error}');
                }}
          ),
    ),
      //for page indicator
    ]);
  }
}
class T2M{
  String month;
  double temp;
  T2M(this.month, this.temp);
}
