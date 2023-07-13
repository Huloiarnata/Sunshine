import 'package:flutter/material.dart';
import 'package:sunshine/Widget/Assets.dart';

import '../../Screen/User.Home.Tabs/News.Tab.dart';
import '../../UserData/articleModel.dart';

class NewsBlock extends StatelessWidget {
  NewsBlock({
    super.key,
    required this.height,
    required this.width,
    required this.widget,
    required this.article

});
  double height;
  double width;
  NewsTab widget;
  final Articles article;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: width*0.04),
          child: article.urlToImage != null
              ? Image.network(article.urlToImage!)
              : Image.asset(AssetsPath.house),
        ),
        Card(
          margin: EdgeInsets.symmetric(horizontal: width*0.04),
          child: ExpansionTile(
            title: Text(article.title),
            subtitle: Text(article.description,maxLines: 1,overflow: TextOverflow.ellipsis,
              softWrap: false,),
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: width*0.04),
                height: height*0.1,
                width: width,
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: width*0.005),
                  scrollDirection: Axis.vertical,
                    child: Text(article.content)),
              )

            ],

          ),
        ),
        SizedBox(height: height*0.025,)
      ],
    );
  }
}
