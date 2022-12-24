import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sunshine/Services/Firebase.google.authentication.dart';
import 'package:sunshine/screens/home.dart';
class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    String logo = 'assets/Logo.svg';
    String landing = 'assets/landing.svg';
    String google = 'assets/google.svg';
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
      children:[
        Positioned(
          top: height*0.1115,
          left: width* 0.005,
          child: SvgPicture.asset(
            logo,
            height: height *0.11,
          ),
        ),
        Column(
        children:<Widget>[
          SizedBox(height: height*0.135),
          SizedBox(
            width: width*0.515,
            child: Text("Sunshine",
                style:TextStyle(
                    fontSize: height * 0.05,
                    fontWeight: FontWeight.w100)
            ),
          ),
          SizedBox(
            height: height *0.4,
            width: width,
            child: SvgPicture.asset(
              landing,
              ),
          ),
          SizedBox(height: height * 0.038),
          SizedBox(
            width: width*0.8,
            child: Text("Towards a\nSustainable\nFuture...",
                style:TextStyle(
                color: const Color(0xFF4B4A4A),
                fontSize: height * 0.039,
                fontWeight: FontWeight.w400)),
          ),
          SizedBox(height: height * 0.04),
          SizedBox(
            width: width * 0.83,
            height: height * 0.0525,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(30))),
                  backgroundColor: const Color(0xFFFFDA69),
                  elevation: 3
            ),
            onPressed: () => AuthService().signInWithGoogle(),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  google
                ),
                SizedBox(width: width * 0.05),
                Text("Sign In with Google",
                    style:TextStyle(
                        color: const Color(0xFF484848),
                        fontSize: height * 0.025,
                        fontWeight: FontWeight.w400)),

              ],
            )
            ),
          ),
          SizedBox(height: height * 0.018),
          RichText(
            text: TextSpan(
                text: 'By continuing you are accepting ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: height *0.013,
                  fontWeight: FontWeight.w300,
                ),
                children: <TextSpan>[
                  TextSpan(text: 'Terms & Conditions',
                      style: TextStyle(
                          color: Colors.blueAccent, fontSize: height * 0.013,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w600
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // navigate to desired screen
                        }
                  )
                ]
            ),
          ),
        ],
      )
    ]));
  }
}
