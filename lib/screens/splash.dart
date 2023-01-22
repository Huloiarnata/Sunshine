import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sunshine/Services/Firebase.google.authentication.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 4),
        () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AuthService().handleAuthState())
        ));
  }

  @override
  Widget build(BuildContext context) {
    String logo = 'assets/Logo.svg';
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: SvgPicture.asset(
                logo,
            ),
          ),
          Positioned(
            top: height * 0.8,
            left: width * 0.37,
            child: Text("Sunshine",
                style:TextStyle(
                    fontSize: height * 0.03,
                    fontWeight: FontWeight.w100)
            ),
          ),
        ],
      ),
    );
  }
}

