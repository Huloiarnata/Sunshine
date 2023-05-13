import 'package:flutter/material.dart';
import 'package:sunshine/Widget/User.Home.Widget/Service.Catalog.dart';
import 'package:sunshine/Widget/User.Home.Widget/Service.Category.Text.dart';
import '../../Widget/Assets.dart';
import '../Home.Screen.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({
    super.key,
    required this.width,
    required this.height,
    required this.widget,
  });

  final double width;
  final double height;
  final HomeScreen widget;

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: widget.width*0.05, top: widget.width*0.1),
                      child: RichText(
                        text: TextSpan(
                            text: 'Welcome\n',
                            style:TextStyle(
                                color: const Color(0xFF696969),
                                fontSize: widget.height * 0.035,
                                fontWeight: FontWeight.w200),
                            children: <TextSpan>[
                              TextSpan(text: "${widget.widget.userInfo.userName}",
                                style:TextStyle(
                                    color: const Color(0xFF4B4A4A),
                                    fontSize: widget.height * 0.035,
                                    fontWeight: FontWeight.w400),
                              ),
                            ]
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: widget.width*0.8, top: widget.height*.06),
                        child: IconButton(
                            iconSize: widget.width*0.105,
                            onPressed: ()=> null,
                            icon:  CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 50, // set the radius of the avatar
                              child: ClipOval(
                                child: Image.network(
                                  widget.widget.userInfo.userPhotoUrl ?? AssetsPath.google,
                                  fit: BoxFit.cover, // set the fit mode of the image
                                ),
                              ),
                            )

                        )
                    ),
                  ]
              ),
              ServiceCategoryText(categoryName: "Area Insights",width: widget.width, height: widget.height),
              ServiceCatalog(width: widget.width, widthFactor: 0.89, height: widget.height,heightFactor: 0.18),
              ServiceCategoryText(categoryName: "Services",width: widget.width, height: widget.height),
              ServiceCatalog(width: widget.width, widthFactor: 0.275, height: widget.height,heightFactor: 0.1),
              ServiceCategoryText(categoryName: "Government Subsidies",width: widget.width, height: widget.height),
              ServiceCatalog(width: widget.width, widthFactor: 0.89, height: widget.height,heightFactor: 0.18),
              ServiceCategoryText(categoryName: "Vendors",width: widget.width, height: widget.height),
              ServiceCatalog(width: widget.width, widthFactor: 0.89, height: widget.height,heightFactor: 0.18),
            ],
          ),
        ),
      ),
    );
  }
}
