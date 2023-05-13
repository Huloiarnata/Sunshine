import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sunshine/Screen/User.Home.Tabs/Profile.Tab.dart';
import 'package:sunshine/UserData/GoogleUserData.dart';
import 'package:sunshine/Widget/User.Home.Widget/Bottom.Navigator.dart';


import 'User.Home.Tabs/Home.Tab.dart';

class HomeScreen extends StatefulWidget {
  final GoogleUserInfo userInfo;
  const HomeScreen(
      {
        Key? key,
        required this.userInfo})
      : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late StreamController<int> _indexController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _indexController = StreamController<int>.broadcast();
  }

  @override
  void dispose() {
    _indexController.close();
    super.dispose();
}
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: BottomNavigator(
          width: width,
           onIndexChanged: (index) {
          _indexController.sink.add(index);
          setState(() {
            _currentIndex = index;
          });
        },

      ),
      body: Builder(builder: (context){
        return StreamBuilder<int>(
            stream: _indexController.stream,
            initialData: _currentIndex,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              switch (snapshot.data) {
                case 0:
                  return HomeTab(width: width, height: height, widget: widget);
                case 1:
                  return const Center(child:  Text('News'));
                case 2:
                  return const Center(child: Text('Notification'));
                default:
                  return const ProfileTab();
              }
            });
        })

      // body: Builder(
      //   builder: (context) {
      //     return HomeTab(width: width, height: height, widget: widget);
      //   }
      // ),
    );
  }
}


