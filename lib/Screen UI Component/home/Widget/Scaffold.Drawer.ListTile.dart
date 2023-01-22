import 'package:flutter/material.dart';

class OptionsListTile extends StatelessWidget {
   OptionsListTile({
    required this.icons,
    required this.optionName,
     this.ontap,
    Key? key,
  }) : super(key: key);
  IconData icons;
  String optionName;
  VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap:()=> ontap ?? Null,
        title: Row(
          children: [
            Icon(icons,color: Colors.black,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(optionName,
                  style:const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300)
              ),
            ),
          ],
        )
    );
  }
}