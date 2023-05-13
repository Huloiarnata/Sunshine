import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
class BottomNavigator extends StatefulWidget {
  const BottomNavigator({
    super.key,
    required this.width,
    required this.onIndexChanged,
  });

  final double width;
  final void Function(int) onIndexChanged;

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int currentIndex = 0;
  final StreamController<int> _streamController = StreamController<int>();
  Stream<int> get indexStream => _streamController.stream;
  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
          elevation: 4,
          backgroundColor: Colors.black, // Set the background color of the BottomNavigationBar to transparent
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          iconSize: widget.width*0.079,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,

          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: currentIndex==0?const Icon(Icons.home):const Icon(Icons.home_outlined),
              label: 'Home',

            ),
            BottomNavigationBarItem(
              icon: currentIndex==1?const Icon(Icons.newspaper):const Icon(Icons.newspaper),
              label: 'News',

            ),
            BottomNavigationBarItem(
              icon: currentIndex==2?const Icon(EvaIcons.bell):const Icon(EvaIcons.bellOutline),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: currentIndex==3?const Icon(CupertinoIcons.person_solid):const Icon(CupertinoIcons.person),

              label: 'Profile',
            ),
          ],
        onTap: (index){
            setState(() {
              currentIndex = index;
              _streamController.sink.add(currentIndex);
            });
            widget.onIndexChanged(currentIndex);
        },
    );

  }
}