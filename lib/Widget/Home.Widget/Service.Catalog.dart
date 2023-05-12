import 'package:flutter/material.dart';

class ServiceCatalog extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: width*0.05,top: height*0.0125),
        child: SizedBox(
          height: height * (heightFactor+0.01),
          width: width* 0.9,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index ){
                return Row(
                  children: [
                  Container(
                  height: height*heightFactor,
                  width: width*widthFactor,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  //color: Color(0xffa1a1a1),
                ),
                    SizedBox(width: width*0.035)
                  ],
                );
              }),
        )
    );
  }
}