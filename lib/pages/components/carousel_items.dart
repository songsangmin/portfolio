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
              children: [ // 왼쪽 소개 파트
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    gradient: kPrimaryGradient,
                    borderRadius: BorderRadius.circular(kBorderRadiusSmall),
                  ),
                  child: Text(
                    "Flutter 개발자",
                    style: TextStyle(
                      fontFamily: 'Jalnan',
                      color: kWhiteColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 16.0,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                SizedBox(height: 24.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "송상민",
                      style: TextStyle(
                        fontFamily: 'Jalnan',
                        color: kTextPrimary,
                        fontSize: 72.0,
                        fontWeight: FontWeight.w900,
                        height: 1.2,
                        letterSpacing: -1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 12, left: 8),
                      child: Text(
                        "Song Sang Min",
                        style: TextStyle(
                          fontFamily: 'Jalnan',
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0,
                          color: kCaptionColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Text(
                  "APP developer, based in Flutter",
                  style: TextStyle(
                    fontFamily: 'Jalnan',
                    color: kTextSecondary,
                    fontSize: 18.0,
                    height: 1.4,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 16.0),
                Wrap(
                  spacing: 8,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: kSurfaceColor,
                        borderRadius: BorderRadius.circular(kBorderRadiusSmall),
                        border: Border.all(
                          color: kPrimaryColor.withValues(alpha: 0.3),
                        ),
                      ),
                      child: Text(
                        "Junior Developer",
                        style: TextStyle(
                          fontFamily: 'Jalnan',
                          color: kTextSecondary,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Scrollable.ensureVisible(
                            Globals.projectKey.currentContext!,
                            duration: Duration(milliseconds: 800),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            gradient: kPrimaryGradient,
                            borderRadius: BorderRadius.circular(kBorderRadiusSmall),
                          ),
                          child: Text(
                            "View Projects",
                            style: TextStyle(
                              color: kWhiteColor,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32.0),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: kPrimaryGradient,
                      borderRadius: BorderRadius.circular(kBorderRadiusSmall),
                      boxShadow: kCardShadow,
                    ),
                    height: 52.0,
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Scrollable.ensureVisible(
                            Globals.aboutKey.currentContext!,
                            duration: Duration(milliseconds: 800),
                            curve: Curves.easeInOut,
                          );
                        },
                        borderRadius: BorderRadius.circular(kBorderRadiusSmall),
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Get Started",
                                style: TextStyle(
                                  color: kWhiteColor,
                                  fontFamily: 'Jalnan',
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(Icons.arrow_forward, color: kWhiteColor, size: 18),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          image: Container( //오른쪽 이미지 파트
           child: Image.asset(
             "assets/me.png",
             fit: BoxFit.contain,
           ),
          ),
        ),
      );