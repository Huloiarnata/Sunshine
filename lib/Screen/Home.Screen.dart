import 'package:flutter/material.dart';
import 'package:sunshine/UserData/GoogleUserData.dart';
import 'package:sunshine/Services/Firebase.Google.Authentication.dart';
import 'package:sunshine/Widget/Assets.dart';
import 'package:sunshine/Widget/Home.Widget/Bottom.Navigator.dart';
import 'package:sunshine/Widget/Home.Widget/Service.Catalog.dart';
import 'package:sunshine/Widget/Home.Widget/Service.Category.Text.dart';

class HomeScreen extends StatefulWidget {
  final GoogleUserInfo userInfo;
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
      bottomNavigationBar: BottomNavigator(width: width),
      body: Builder(
        builder: (context) {
          return SingleChildScrollView(
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                       Stack(
                        children: [
                         Padding(
                           padding: EdgeInsets.only(left: width*0.05, top: width*0.1),
                            child: RichText(
                              text: TextSpan(
                                  text: 'Welcome\n',
                                  style:TextStyle(
                                      color: const Color(0xFF696969),
                                      fontSize: height * 0.035,
                                      fontWeight: FontWeight.w200),
                                  children: <TextSpan>[
                                    TextSpan(text: "${widget.userInfo?.userName}",
                                      style:TextStyle(
                                          color: const Color(0xFF4B4A4A),
                                          fontSize: height * 0.035,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ]
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: width*0.8, top: height*.06),
                              child: IconButton(
                                iconSize: width*0.105,
                                  onPressed: ()=> AuthService().signOutGoogle(),
                                  icon:  CircleAvatar(
                                    backgroundColor: Colors.black,
                                    radius: 50, // set the radius of the avatar
                                    child: ClipOval(
                                      child: Image.network(
                                        widget.userInfo?.userPhotoUrl ?? AssetsPath.google!,
                                        fit: BoxFit.cover, // set the fit mode of the image
                                      ),
                                    ),
                                  )

                              )
                          ),
                        ]
                      ),
                    ServiceCategoryText(categoryName: "Area Insights",width: width, height: height),
                    ServiceCatalog(width: width, widthFactor: 0.89, height: height,heightFactor: 0.18),
                    ServiceCategoryText(categoryName: "Services",width: width, height: height),
                    ServiceCatalog(width: width, widthFactor: 0.275, height: height,heightFactor: 0.1),
                    ServiceCategoryText(categoryName: "Government Subsidies",width: width, height: height),
                    ServiceCatalog(width: width, widthFactor: 0.89, height: height,heightFactor: 0.18),
                    ServiceCategoryText(categoryName: "Vendors",width: width, height: height),
                    ServiceCatalog(width: width, widthFactor: 0.89, height: height,heightFactor: 0.18),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}


