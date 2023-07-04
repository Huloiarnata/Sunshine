// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:sunshine/Widget/Assets.dart';
import 'package:sunshine/Widget/User.Home.Widget/InsightChart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../Services/AreaInsights/APIServices.dart';
import '../../Services/AreaInsights/DataOperations.dart';


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
  late TrackballBehavior _trackballBehavior;
  @override
  void initState(){
    _trackballBehavior = TrackballBehavior(
        enable: true,
        markerSettings: const TrackballMarkerSettings(markerVisibility: TrackballVisibilityMode.visible),
      activationMode: ActivationMode.singleTap,
      tooltipSettings: const InteractiveTooltip(
        enable: true,
        format: 'point.y'
      )
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
       FutureBuilder(
              future: APIServices.fetchInsightData(),
              builder: (context,snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(
                    child: Container(
                      height: widget.height*0.36,
                      width: MediaQuery.sizeOf(context).width*0.9,
                      margin: EdgeInsets.all(widget.width*0.00),

                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(20), // Adjust the radius value to change the roundness
                      ),
                      child: Stack(
                       // mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                        alignment: AlignmentDirectional.center,
                          children:[

                      SizedBox(height: widget.width*0.18,
                          child: const RiveAnimation.asset(AssetsPath.loading)),
                            Text("\n\n\n\nLoading",style: TextStyle(
                              color: Colors.black, // Customize the color of the category labels
                              fontSize: widget.height*0.014, // Customize the font size of the category labels
                              fontWeight: FontWeight.w300, // Customize the font weight of the category labels
                            ),)

                ]),
                    ),
                  );
                }
                else if (snapshot.hasData) {
                  String data = snapshot.data??'';

                  List<Content> t2m = DataOperations().dataCleaning(data,'T2M');
                  List<Content> ws50m = DataOperations().dataCleaning(data,'WS50M');
                  List<Content> wd50m = DataOperations().dataCleaning(data,'WD50M');
                  List<Content> preci = DataOperations().dataCleaning(data,'PRECTOTCORR');
                  List<Content> ASALB = DataOperations().dataCleaning(data,'ALLSKY_SRF_ALB');
                  List<Content> ALLSKYDWN = DataOperations().dataCleaning(data,'ALLSKY_SFC_SW_DWN');
                  List<Content> CLRSKYDWN= DataOperations().dataCleaning(data,'CLRSKY_SFC_SW_DWN');
                  List<List<Content>> allData = [ALLSKYDWN,CLRSKYDWN,ASALB,t2m,ws50m,wd50m,preci];
                  List<String> alltitle = ["All Sky DWN [kW-hr/m^2/day]","Clear Sky DWN [kW-hr/m^2/day]", "All Sky Srf Albedo","Temp at 2M [°c]","Wind Speed at 50M [m/s]","Wind Direction at 50M [Degrees]","Precipitation [mm/day]"];
                  return Center(
                    child: SizedBox(
                        height: widget.height*0.36,
                        width: MediaQuery.sizeOf(context).width*0.9,
                child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 7,
                        itemBuilder: (BuildContext context, int index ){

                          return Row(children:[
                            Container(
                              height: widget.height*0.36,
                              width: MediaQuery.sizeOf(context).width*0.9,
                              margin: EdgeInsets.all(widget.width*0.0),

                              decoration: BoxDecoration(
                                color: const Color(0xFFFFFFFF),
                                borderRadius: BorderRadius.circular(20),
                                // Adjust the radius value to change the roundness
                              ),
                              child:SPLineCharts(trackballBehavior: _trackballBehavior, widget: widget, meteorologicalData: allData[index],title:"      "+alltitle[index],)
                          ),
                            SizedBox(width: widget.width*0.035)

                          ]);
                        })),
                  );
                } else {
                  return Text('Error occurred: ${snapshot.error}');
                }}
          ),

      //for page indicator
    ]);
  }
}
