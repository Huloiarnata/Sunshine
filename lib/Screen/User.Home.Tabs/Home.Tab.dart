import 'package:flutter/material.dart';
import 'package:sunshine/Widget/User.Home.Widget/AreaInsight.widget.dart';
import 'package:sunshine/Widget/User.Home.Widget/Service.Catalog.dart';
import 'package:sunshine/Widget/User.Home.Widget/Service.Category.Text.dart';
import '../../Widget/Assets.dart';
import '../../Widget/User.Home.Widget/GovtSubsidy.Catalog.dart';
import '../../Widget/User.Home.Widget/GuideRenewable.Catalog.dart';
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
                                color: const Color(0xFF333333),
                                fontSize: widget.height * 0.037,
                                fontWeight: FontWeight.w200),
                            children: <TextSpan>[
                              TextSpan(text: "${widget.widget.userInfo.userName}",
                                style:TextStyle(
                                    color:const Color(0xFF303133),
                                    fontSize: widget.height * 0.037,
                                    fontWeight: FontWeight.w500),
                              ),
                            ]
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: widget.width*0.8, top: widget.height*.06),
                        child: IconButton(
                            iconSize: widget.width*0.12,
                            onPressed: ()=> null,
                            icon:  CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 60, // set the radius of the avatar
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
              SizedBox(height: widget.height*0.0235,),
              AreaInsight(width: widget.width, widthFactor: 0.275, height: widget.height,heightFactor: 0.1),
              ServiceCategoryText(categoryName: "Services",width: widget.width, height: widget.height),
              ServiceCatalog(width: widget.width, widthFactor: 0.275, height: widget.height,heightFactor: 0.15),
              ServiceCategoryText(categoryName: "Government Assistance",width: widget.width, height: widget.height),
              GovtSubsidyCatalog(width: widget.width, widthFactor: 0.89, height: widget.height,heightFactor: 0.18),
              ServiceCategoryText(categoryName: "Guide to Renewable Energy",width: widget.width, height: widget.height),
              GuideRenewableCatalog(width: widget.width, widthFactor: 0.89, height: widget.height,heightFactor: 0.4),
            ],
          ),
        ),
      ),
    );
  }
}
