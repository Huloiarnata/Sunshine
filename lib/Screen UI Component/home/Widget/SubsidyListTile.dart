import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
    CustomListTile({
      required this.height,
      required this.width,
      //required this.onTap,
      this.borderRadius,
      this.tilecolor,
      this.leadingText,
    Key? key,
  }) : super(key: key);
  //VoidCallback? onTap;
  double height;
  double width;
  int? tilecolor;
  double? borderRadius;
  String? leadingText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 10)),
        color: Color(tilecolor ?? 0xFFE5F9F1),
      ),
      height: height,
      width: width,
      child: ListTile(
        leading: Text(leadingText ?? "Add Text!") ,
        onTap: ()=>Null,

      ),
    );
  }
}