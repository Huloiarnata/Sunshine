import 'package:flutter/material.dart';
import 'package:sunshine/Screen%20UI%20Component/home/Draggable.Scrollable.Content.dart';
import 'package:sunshine/Screen%20UI%20Component/home/Scaffold.drawer.dart';
import '../Screen UI Component/home/Search.Location.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: const Option(),
      body: Builder(
        builder: (context) {
          return Stack(
            children: <Widget>[
              ServicesUI(height,width),
              SearchLocationUI(height,width,context),
            ],
          );
        }
      ),
    );
  }
}
