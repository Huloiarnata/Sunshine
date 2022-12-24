import 'package:flutter/material.dart';
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
              Text("Ronit Kumar >",
                  style:TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                  )
              ),
              SizedBox(
                height: 10,
              ),
            ],
          )
          ),
          ListTile(
            title: Row(
              children:const [
                Icon(Icons.info_outline,color: Colors.black,),
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text("About",
                      style:TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400)
                  ),
                ),
              ],
            )
          ),
          ListTile(
              title: Row(
                children:const [
                  Icon(Icons.support_sharp,color: Colors.black,),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text("Support",
                        style:TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400)
                    ),
                  ),
                ],
              )
          ),

          ListTile(
              title: Row(
                children:const [
                  Icon(Icons.logout_sharp,color: Colors.black,),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text("Log Out",
                        style:TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400)
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

