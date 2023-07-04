import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sunshine/Widget/Assets.dart';
class GuideRenewableCatalog extends StatefulWidget {
  const GuideRenewableCatalog({
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
  State<GuideRenewableCatalog> createState() => _GuideRenewableCatalogState();
}

class _GuideRenewableCatalogState extends State<GuideRenewableCatalog> {
  final List<String> guideTitle = ['Rooftop PV System','System Components','Maintenance Categorization'];
  final List<String> guideSubtitle = ['','',''];
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: widget.width*0.05,top: widget.height*0.0125),
        child: SizedBox(
          height: widget.height * (widget.heightFactor),
          width: widget.width* 0.9,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index ){
                return Column(
                  children: [
                    Container(
                        height: widget.height*0.075,
                        width: widget.width*widget.widthFactor,
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: const Offset(0, 2), // controls the shadow position
                            ),
                          ],
                        ),
                        //color: Color(0xffa1a1a1),
                        child: ListTile(
                          contentPadding:const EdgeInsets.symmetric(horizontal: 40.0),
                          trailing: const Icon(CupertinoIcons.arrow_right,color: Colors.green,)
                          ,title: Text(guideTitle[index]),
                          subtitle: Text("Hello World"),
                        )
                    ),

                    SizedBox(height: widget.width*0.035)
                  ],
                );
              }),
        )
    );
  }
}