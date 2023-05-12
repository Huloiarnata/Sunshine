import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sunshine/Services/Firebase.Google.Authstate.dart';
import 'package:sunshine/Widget/Assets.dart';
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
        () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AuthProvider().handleAuthState())
        ));
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: SvgPicture.asset(
                AssetsPath.logo,
                height: height*0.23, width: height*0.23,
                fit: BoxFit.scaleDown
            ),
          ),

          Positioned(
            top: height * 0.8,
            left: width * 0.37,
            child: Text("Sunshine",
                style:TextStyle(
                    fontSize: height * 0.03,
                    fontWeight: FontWeight.w300)
            ),
          ),
          Positioned(
              top: height * 0.84,
              left: width * 0.45,
              child: Transform.scale(
                scale:0.4,
                child: const CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Colors.black,
                ),
              )),
        ],
      ),
    );
  }
}

