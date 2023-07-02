import 'package:flutter/material.dart';
import "Home.Services.list.dart";
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
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: widget.width*0.05,top: widget.height*0.0125),
        child: SizedBox(
          height: widget.height * (widget.heightFactor+0.01),
          width: widget.width* 0.9,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index ){
                return Row(
                  children: [
                  Container(
                  height: widget.height*widget.heightFactor,
                  width: widget.width*widget.widthFactor,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  //color: Color(0xffa1a1a1),
                    child: ListTile(
                      //title: Text(ServicesNames(index: index).getName(index)),
                    ),
                ),
                    SizedBox(width: widget.width*0.035)
                  ],
                );
              }),
        )
    );
  }
}