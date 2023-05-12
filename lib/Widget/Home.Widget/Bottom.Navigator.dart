import 'package:flutter/material.dart';
class BottomNavigator extends StatelessWidget {
  const BottomNavigator({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black, // Set the background color of the container
      child: BottomNavigationBar(
        elevation: 4,
        backgroundColor: Colors.transparent, // Set the background color of the BottomNavigationBar to transparent
        unselectedItemColor: Colors.black54,
        selectedItemColor: Colors.black,
        iconSize: width*0.074,
        showSelectedLabels: false,
        showUnselectedLabels: false,
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
      ),
    );

  }
}