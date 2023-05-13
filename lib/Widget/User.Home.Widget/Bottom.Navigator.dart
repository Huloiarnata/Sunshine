import 'dart:async';

import 'package:flutter/material.dart';
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
          iconSize: widget.width*0.074,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper),
              label: 'News',

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_active_outlined),
              label: 'Setting',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
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