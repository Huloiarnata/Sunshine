import 'package:flutter/material.dart';
import 'package:sunshine/Widget/Assets.dart';
class GovtSubsidyCatalog extends StatefulWidget {
  const GovtSubsidyCatalog({
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
  State<GovtSubsidyCatalog> createState() => _GovtSubsidyCatalogState();
}

class _GovtSubsidyCatalogState extends State<GovtSubsidyCatalog> {
  final List<String> serviceTitle = ['Guidelines on Solar\nRooftop Adoption\n(ULB)','Union & State\nSubsidy','States USRWP\nProcess Flow'];
  final List<String> serviceLogo = [AssetsPath.guideline,AssetsPath.discount,AssetsPath.flag];
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: widget.width*0.05,top: widget.height*0.0125),
        child: SizedBox(
          height: widget.height * (widget.heightFactor+0.01),
          width: widget.width* 0.9,
          child: ListView.builder(
              //physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index ){
                return

                  Row(
                  children: [
                    Container(
                        height: widget.height*widget.heightFactor,
                        width: widget.width*widget.widthFactor,
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        //color: Color(0xffa1a1a1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(serviceLogo[index],width: widget.width*0.52,),
                              Text(serviceTitle[index],textAlign: TextAlign.left,
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