import 'package:flutter/material.dart';

class ServiceCategoryText extends StatelessWidget {
  const ServiceCategoryText({
    super.key,
    required this.categoryName,
    required this.width,
    required this.height,

  });

  final double width;
  final double height;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: width * 0.05, top: height * 0.015),
      child: Text(categoryName,
        style: TextStyle(
            color: Colors.black,
            fontSize: height * 0.018,
            fontWeight: FontWeight.w500),),
    );
  }}