import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../UserData/articleModel.dart';

class ApiServices{
  final String _apiKey = "fb52e58bc3cf421d979e18b27a8e26fb";
  Future<List<Articles>> fetchNews()async{
    var url = Uri.parse('https://newsapi.org/v2/everything?q=energy&apiKey=$_apiKey');
    final response = await http.get(url);
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];
    List<Articles> articles = body.map((dynamic item) => Articles.fromJson(item)).toList();
    //print(articles[5].content);
    return articles;
  }
}