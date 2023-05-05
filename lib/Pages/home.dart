import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sunshine/UserData/GoogleUserData.dart';
import 'package:sunshine/Services/Firebase.google.authentication.dart';

class HomeScreen extends StatefulWidget {
  final GoogleUserInfo? userInfo;
  const HomeScreen(
      {Key? key, required this.userInfo}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(

        elevation: 4,
        backgroundColor: Color(0xffd2d2d2),
        unselectedItemColor: Color(0xff7D7D7D),
        selectedItemColor: Colors.black,
        iconSize: width*0.074,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items:const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_active_outlined),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          )
        ],
      ),
      body: Builder(
        builder: (context) {
          return SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                     Stack(
                      children: [
                       Padding(
                         padding: EdgeInsets.only(left: width*0.05, top: width*0.05),
                          child: RichText(
                            text: TextSpan(
                                text: 'Welcome\n',
                                style:TextStyle(
                                    color: const Color(0xFF696969),
                                    fontSize: height * 0.039,
                                    fontWeight: FontWeight.w200),
                                children: <TextSpan>[
                                  TextSpan(text: "${widget.userInfo?.userName}",
                                    style:TextStyle(
                                        color: const Color(0xFF4B4A4A),
                                        fontSize: height * 0.039,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ]
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: width*0.85, top: height*.065),
                            child: IconButton(
                                onPressed: ()=> AuthService().signOutGoogle(),
                                icon:  Icon(Icons.more_vert,size: height*0.04,)
                            )
                        ),
                      ]
                    ),
                  Padding(
                    padding: EdgeInsets.only(left: width*0.05,top:  height*0.025),
                    child: Text("Area Insights",
                      style:TextStyle(
                        color: const Color(0xFF4B4A4A),
                        fontSize: height * 0.0185,
                        fontWeight: FontWeight.w700),),
                  ),
            Padding(
            padding: EdgeInsets.only(left: width*0.05,top:  height*0.025),
                  child: Container(
                    height: height*.15,
                    width: width*0.85,
                    decoration: BoxDecoration(
                      color: const Color(0xcca1a1a1),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    //color: Color(0xffa1a1a1),
                  )),
                  Padding(
                    padding: EdgeInsets.only(left: width*0.05,top:  height*0.025),
                    child: Text("Services",
                      style:TextStyle(
                          color: const Color(0xFF4B4A4A),
                          fontSize: height * 0.0185,
                          fontWeight: FontWeight.w700),),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: width*0.05,top:  height*0.025),
                      child: Container(
                        height: height*.15,
                        width: width*0.85,
                        decoration: BoxDecoration(
                          color: const Color(0x82B0B8FF),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        //color: Color(0xffa1a1a1),
                      )),
                  Padding(
                    padding: EdgeInsets.only(left: width*0.05,top:  height*0.025),
                    child: Text("Government Subsidies",
                      style:TextStyle(
                          color: const Color(0xFF4B4A4A),
                          fontSize: height * 0.0185,
                          fontWeight: FontWeight.w700),),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: width*0.05,top:  height*0.025),
                      child: Container(
                        height: height*.15,
                        width: width*0.85,
                        decoration: BoxDecoration(
                          color: const Color(0xFF9EE7AD),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        //color: Color(0xffa1a1a1),
                      )),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
