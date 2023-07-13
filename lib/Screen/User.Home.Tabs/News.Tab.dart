import 'package:flutter/material.dart';
import 'package:sunshine/Screen/Home.Screen.dart';

import '../../Services/News/apiServices.dart';
import '../../UserData/articleModel.dart';
import '../../Widget/User.News.Widget/newsBlock.dart';

class NewsTab extends StatefulWidget {
  NewsTab(
      {super.key,
      required this.height,
      required this.width,
      required this.widget});
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: widget.width*0.04,vertical: widget.width*0.06),
            child: Text("News",
            style: TextStyle(
                color: Colors.black,
                fontSize: widget.height * 0.04,
                fontWeight: FontWeight.w700),),),
          Expanded(
            child: FutureBuilder<List<Articles>>(
              future: ApiServices().fetchNews(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData) {
                  List<Articles> articles = snapshot.data!;
                  if (articles != null) {
                    return ListView.builder(
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        return NewsBlock(height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width, widget: widget, article: articles[index]);
                      },
                    );
                  } else {
                    return const Text('No News');
                  }
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return const Text('No news');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
