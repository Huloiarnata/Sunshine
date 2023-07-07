import 'package:flutter/material.dart';
import 'package:sunshine/Screen/Home.Screen.dart';
class NewsTab extends StatefulWidget {
  NewsTab({super.key,required this.height,required this.width,required this.widget});
  double height;
  double width;
  final HomeScreen widget;

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.symmetric(vertical: 300),
      child: Column(
        children: [
          Text("News")
        ],
      ),
    );
  }
}
