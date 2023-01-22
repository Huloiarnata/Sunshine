
import 'package:flutter/material.dart';

Widget SearchLocationUI(height, width, context){
  return Positioned(
    top: height*0.075,
    left: width*0.035,
    child: SizedBox(
      width: width * 0.93,
      height: height *0.065,
      child: Material(
        elevation: 5,
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: IconButton(

              icon: const Icon(Icons.menu),
              onPressed: ()=> Scaffold.of(context).openDrawer(),
            ),
            prefixIconColor: Colors.black,
            hintText: "Search your location",
            hintStyle: TextStyle(
                fontSize: height*0.017,
                color: Colors.black87,
              fontWeight: FontWeight.w300
            ),
            border:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            suffixIcon: IconButton(
              onPressed:()=> Null,
              icon: Icon(Icons.gps_fixed,size: height * 0.022,),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1.3,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1.3,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}