import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Services/Firebase.Google.Authentication.dart';
import '../../Widget/Assets.dart';
import '../Home.Screen.dart';
class ProfileTab extends StatefulWidget {
  const ProfileTab({
    super.key,
    required this.width,
    required this.height,
    required this.widget,
  });

  final double width;
  final double height;
  final HomeScreen widget;

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  List<String> profileSettings = ["About us","Our Sources","Log Out", "Delete Account"];
  List<int> optionColours = [0xE4151515,0xE4151515,0xE4A80303];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: const Color(0xFF101010),
          height: widget.height*0.3,
          width: widget.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.greenAccent,
                radius: 50, // set the radius of the avatar
                child: ClipOval(
                  child: Image.network(
                    widget.widget.userInfo.userPhotoUrl ?? AssetsPath.google,
                    fit: BoxFit.fill, // set the fit mode of the image
                  ),
                ),
              ),
              SizedBox(height: widget.height*0.015),
              Text(widget.widget.userInfo.userName??"",
                style:TextStyle(
                  color:const Color(0xE4FFFFFF),
                  fontSize: widget.height * 0.018,
                  fontWeight: FontWeight.w400),),
              SizedBox(height: widget.height*0.00),
              Text(widget.widget.userInfo.userEmail??"",
                style:TextStyle(
                    color:const Color(0xE4FFFFFF),
                    fontSize: widget.height * 0.015,
                    fontWeight: FontWeight.w300),),
              SizedBox(height: widget.height*0.015),
            ],
          )
        ),
    Padding(
    padding: EdgeInsets.only(left: widget.width*0.0,top: widget.height*0.0125),
    child: SizedBox(
    height: widget.height * (0.49),
    width: widget.width* 0.9,
    child: ListView.builder(
    physics: const NeverScrollableScrollPhysics(),
    scrollDirection: Axis.vertical,
    itemCount: 3,
    itemBuilder: (BuildContext context, int index ){
    return Column(
    children: [
    Container(
    height: widget.height*0.075,
    width: widget.width*0.89,
    decoration: BoxDecoration(
    color: const Color(0xffffffff),
    borderRadius: BorderRadius.circular(10.0),

    ),
    child: ListTile(
    contentPadding:const EdgeInsets.symmetric(horizontal: 40.0)
    ,title: Text(profileSettings[index],
      style:TextStyle(
        color: Color(optionColours[index]),
        fontSize: widget.height * 0.018,
        fontWeight: FontWeight.w400),),
      onTap: () =>AuthService().signOutGoogle() ,
    )
    ),

    SizedBox(height: widget.width*0.035)
    ],
    );
    }),
    )
    )
    ]);
  }
}
