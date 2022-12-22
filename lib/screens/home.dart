import 'package:flutter/material.dart';
import 'package:sunshine/Services/Firebase.google.authentication.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(30))),
                backgroundColor: const Color(0xFFFFDA69),
                elevation: 3
            ),
            onPressed: () => AuthService().signOutGoogle(),
            child:const Text("Log Out with Google",
                style:TextStyle(
                    color: Color(0xFF484848),
                    fontSize: 20,
                    fontWeight: FontWeight.w400)),
        ),
      ),
    );
  }
}
