import 'package:flutter/material.dart';
import 'package:sunshine/Screen%20UI%20Component/home/Widget/Scaffold.Drawer.ListTile.dart';
import 'package:sunshine/Services/Firebase.google.authentication.dart';
class Option extends StatefulWidget {
  const Option({Key? key}) : super(key: key);

  @override
  State<Option> createState() => _OptionState();
}

class _OptionState extends State<Option> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10,
      child: ListView(
        children: [
          DrawerHeader(child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children:const <Widget>[
              CircleAvatar(
                backgroundColor: Colors.green,
                radius: 35
              ),
              SizedBox(
                height: 20,
              ),
              Text("Ronit Kumar",
                  style:TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                  )
              ),
              SizedBox(
                height: 8,
              ),
            ],
          )
          ),
          OptionsListTile(icons: Icons.info_outline, optionName: "About"),
          OptionsListTile(icons: Icons.support_sharp, optionName: "Support"),
          //OptionsListTile(icons: Icons.logout_sharp, optionName: "Log Out",ontap:()=> AuthService().signOutGoogle()),
          ListTile(
            title: Row(
              children:const [
                Icon(Icons.logout_sharp,color: Colors.black,),
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text("Log Out",
                      style:TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300)
                  ),
                ),
              ],
            ),
            onTap: ()=> AuthService().signOutGoogle(),
          ),
        ],
      ),
    );
  }
}

