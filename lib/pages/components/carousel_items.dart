import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/constants.dart';

import '../../models/carousel_item_model.dart';
import 'package:flutter/material.dart';

import '../../utils/globals.dart';

List<CarouselItemModel> carouselItems = List.generate(
  5,
        (index) => CarouselItemModel(
          text: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Flutter 개발자",
                style: TextStyle(
                  fontFamily: 'Jalnan',
                 color: kBackgroundColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 16.0,
                ),
                ),
                SizedBox(
                  height: 18.0,
                ),
                Row(
                  children: [
                    Text("송상민",
                      style: TextStyle(
                        fontFamily: 'Jalnan',
                      color: Colors.black,
                      fontSize: 80.0,
                      fontWeight: FontWeight.w900,
                      height: 1.3,
                    ),),
                    Column(
                      children: [
                        SizedBox(height: 50.0,),
                        Text("Song Sang Min",
                        style: TextStyle(
                          fontFamily: 'Jalnan',
                          fontWeight: FontWeight.w600,
                          fontSize: 15.0,
                          color: Colors.black12
                        ),),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text("APP developer, based in Flutter",
                style: TextStyle(
                  fontFamily: 'Jalnan',
                  color: Colors.black45,
                  fontSize: 15.0,
                  height: 1.0,
                ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: Wrap(
                    children: [
                      Text("Junior Developer",style: TextStyle(
                        fontFamily: 'Jalnan',
                        color: Colors.black45,
                        fontSize: 15.0,
                        height: 1.5,
                      ),),
                      GestureDetector(
                        onTap: () {},
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Text(
                            "Project talk",
                            style: TextStyle(
                              height: 1.5,
                              color: Colors.white,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 25.0,
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Container(
                    decoration: BoxDecoration(
                      color: kBackgroundColor,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    height: 48.0,
                    padding: EdgeInsets.symmetric(
                      horizontal: 28.0,
                    ),
                    child: TextButton(
                      onPressed: () {
                        Scrollable.ensureVisible(
                          Globals.aboutKey.currentContext!,
                          duration: Duration(seconds: 1),
                        );
                      },
                      child: Text(
                        "Get Start",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Jalnan',
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ),
                  ),
                )
              ],
            ),
          ),
          image: Container(
           child: Image.asset(
             "assets/me.png",
             fit: BoxFit.contain,
           ),
          ),
        ),
      );