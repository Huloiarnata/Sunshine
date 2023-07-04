import 'package:flutter/material.dart';
import 'package:sunshine/Widget/Assets.dart';
class ServiceCatalog extends StatefulWidget {
  const ServiceCatalog({
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
  State<ServiceCatalog> createState() => _ServiceCatalogState();
}

class _ServiceCatalogState extends State<ServiceCatalog> {
  final List<String> serviceTitle = ['Savings\nCalculator','Energy\nEstimation','Solar System\nDesign'];
  final List<String> serviceLogo = [AssetsPath.piggy,AssetsPath.lighting,AssetsPath.house];
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: widget.width*0.05,top: widget.height*0.0125),
        child: SizedBox(
          height: widget.height * (widget.heightFactor+0.01),
          width: widget.width* 0.9,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index ){
                return Row(
                  children: [
                  Container(
                  height: widget.height*widget.heightFactor,
                  width: widget.width*widget.widthFactor,
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(10.0),

                  ),
                  //color: Color(0xffa1a1a1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(serviceLogo[index],height: 30,),
                          SizedBox( height: widget.height*0.02),
                          Text(serviceTitle[index],textAlign: TextAlign.center,
                              style:const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w400))
                        ]
                      )
                    ),

                    SizedBox(width: widget.width*0.035)
                  ],
                );
              }),
        )
    );
  }
}