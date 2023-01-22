import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sunshine/Screen%20UI%20Component/home/Widget/SubsidyListTile.dart';

Widget ServicesUI(height, width) {
  return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.7,
      maxChildSize: 0.85,
      builder: (BuildContext context, ScrollController myScrollController) {
        return ListView(controller: myScrollController, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Green Bar
              Container(
                height: height * 0.045,
                width: width,
                color: const Color(0xFF50BD5F),
              ),
              SizedBox(height: height / width * 6),
              Row(
                children: [
                  SizedBox(width: height / width * 12),
                  Text("Govt. Subsidy",
                      style: TextStyle(
                          color: const Color(0xFF444343),
                          fontSize: height * 0.015,
                          fontWeight: FontWeight.w400)),
                ],
              ),
              SizedBox(height: height / width * 6),
              SizedBox(
                  height: height * 0.175,
                  //List View for Government Subsidy.
                  child: ListView(
                    padding: const EdgeInsets.all(5),
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      //First List Tile
                      CustomListTile(
                        height: height * 0.75,
                        width: width * 0.65,
                        leadingText: "Government\nAds",
                      ),
                      //Seperation
                      SizedBox(width: width * 0.05),
                      //Second List Tile
                      CustomListTile(
                        height: height * 0.75,
                        width: width * 0.65,
                        leadingText: "Government\nAds",
                      ),
                      //Seperation
                      SizedBox(width: width * 0.05),
                      //Third List Tile
                      CustomListTile(
                        height: height * 0.75,
                        width: width * 0.65,
                        leadingText: "Government\nAds",
                      ),
                    ],
                  )),
              //SmoothPageIndicator(, count: 3),
              SizedBox(height: height / width * 7),
              Row(
                children: [
                  SizedBox(width: height / width * 12),
                  Text("Services",
                      style: TextStyle(
                          color: const Color(0xFF444343),
                          fontSize: height * 0.015,
                          fontWeight: FontWeight.w400)),
                ],
              ),
              SizedBox(height: height / width * 6),
              SizedBox(
                  height: height * 0.175,
                  //List View for Government Subsidy.
                  child: ListView(
                    padding: const EdgeInsets.all(5),
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      //First List Tile
                      CustomListTile(
                        height: height * 0.75,
                        width: width * 0.4,
                        leadingText: "Solar\nInformation",
                      ),
                      //Seperation
                      SizedBox(width: width * 0.05),
                      //Second List Tile
                      CustomListTile(
                        height: height * 0.75,
                        width: width * 0.4,
                        leadingText: "Wind\nInformation",
                      ),
                      //Seperation
                      SizedBox(width: width * 0.05),
                      //Third List Tile
                      CustomListTile(
                        height: height * 0.75,
                        width: width * 0.4,
                        leadingText: "Compare\nBill",
                      ),
                    ],
                  )),
              SizedBox(height: height / width * 6),
              Row(
                children: [
                  SizedBox(width: height / width * 12),
                  Text("More Information",
                      style: TextStyle(
                          color: const Color(0xFF444343),
                          fontSize: height * 0.015,
                          fontWeight: FontWeight.w400)),
                ],
              ),
              SizedBox(height: height / width * 6),
              SizedBox(
                  height: height * 0.175,
                  //List View for Government Subsidy.
                  child: ListView(
                    padding: const EdgeInsets.all(5),
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      //First List Tile
                      CustomListTile(
                        height: height * 0.75,
                        width: width * 0.5,
                        leadingText: "Advantages\nRenewable Energy",
                      ),
                      //Seperation
                      SizedBox(width: width * 0.05),
                      //Second List Tile
                      CustomListTile(
                        height: height * 0.75,
                        width: width * 0.5,
                        leadingText: "Taking care of\nEquipment",
                      ),
                      //Seperation
                      SizedBox(width: width * 0.05),
                      //Third List Tile
                      CustomListTile(
                        height: height * 0.75,
                        width: width * 0.5,
                        leadingText: "What's\nNew!",
                      ),
                    ],
                  )),
            ],
          ),
        ]);
      });
}
