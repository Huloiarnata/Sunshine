import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sunshine/Services/Firebase.Google.Authentication.dart';
import 'package:sunshine/Widget/Assets.dart';
class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
      children:[
        Positioned(
          top: height*0.1115,
          left: width* 0.005,
          child: SvgPicture.asset(
            AssetsPath.logo,
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
                    fontSize: height * 0.048,
                    fontWeight: FontWeight.w200,
                  color: const Color(0xFF4B4A4A),

                )
            ),
          ),
          SizedBox(
            height: height *0.4,
            width: width,
            child: SvgPicture.asset(
              AssetsPath.landing,
              ),
          ),
          SizedBox(height: height * 0.038),
          SizedBox(
            width: width*0.8,
            child: RichText(
              text: TextSpan(
                  text: 'Towards a\n',
                style:TextStyle(
                       color: const Color(0xFF696969),
                       fontSize: height * 0.039,
                     fontWeight: FontWeight.w200),
                  children: <TextSpan>[
                    TextSpan(text: 'Sustainable\n',
                  style:TextStyle(
                         color: const Color(0xFF4B4A4A),
                         fontSize: height * 0.039,
                       fontWeight: FontWeight.w400),
                    ),
                    TextSpan(text: 'Future...',
                        style:TextStyle(
                              color: const Color(0xFF696969),
                               fontSize: height * 0.039,
                               fontWeight: FontWeight.w200
                        ),
                    )
                  ]
              ),
            ),
          ),
          SizedBox(height: height * 0.04),
          SizedBox(
            width: width * 0.83,
            height: height * 0.062,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(10))),
                  backgroundColor: Colors.black,
                  elevation: 4
            ),
            onPressed: () => AuthService().signInWithGoogle(),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  AssetsPath.google
                ),
                SizedBox(width: width * 0.05),
                Text("Sign In with Google",
                    style:TextStyle(
                        color: const Color(0xFFF8F8F8),
                        fontSize: height * 0.025,
                        fontWeight: FontWeight.w400)),

              ],
            )
            ),
          ),
          SizedBox(height: height * 0.016),
          RichText(
            text: TextSpan(
                text: 'By continuing you are accepting ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: height *0.014,
                  fontWeight: FontWeight.w400,
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
