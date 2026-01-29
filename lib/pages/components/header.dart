import 'package:flutter/material.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/screen_helper.dart';
import '../../models/header_item.dart';
import '../../utils/globals.dart';

// Header 구성 목록
List<HeaderItem> headerItems = [
  HeaderItem(
    title: "HOME",
    onTap: () {
      Scrollable.ensureVisible(
        Globals.homeKey.currentContext!,
        duration: Duration(seconds: 1),
      );
    },
  ),
  HeaderItem(
    title: "ABOUT",
    onTap: () {
      Scrollable.ensureVisible(
        Globals.aboutKey.currentContext!,
        duration: Duration(seconds: 1),
      );
    },
  ),
  HeaderItem(
    title: "SKILLS",
    onTap: () {
      Scrollable.ensureVisible(
        Globals.skillKey.currentContext!,
        duration: Duration(seconds: 1),
      );
    },
  ),
  HeaderItem(
    title: "PROJECT",
    onTap: () {
      Scrollable.ensureVisible(
        Globals.projectKey.currentContext!,
        duration: Duration(seconds: 1),
      );
    },
  ),
  HeaderItem(
    title: "CAREER",
    onTap: () {
      Scrollable.ensureVisible(
        Globals.careerKey.currentContext!,
        duration: Duration(seconds: 1),
      );
    },
  ),
];

//헤더 로고 구성
class HeaderLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Scrollable.ensureVisible(
            Globals.homeKey.currentContext!,
            duration: Duration(milliseconds: 800),
            curve: Curves.easeInOut,
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kBorderRadiusSmall),
            gradient: kPrimaryGradient,
            boxShadow: kCardShadow,
          ),
          child: Text(
            "<Sangmin Song/>",
            style: TextStyle(
              fontFamily: 'Jalnan',
              color: kWhiteColor,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}

//헤더 메뉴 구성
class HeaderRow extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      children: headerItems.map((item) {
        if (item.isButton) {
          return MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
              margin: EdgeInsets.only(right: 12.0),
              decoration: BoxDecoration(
                gradient: kPrimaryGradient,
                borderRadius: BorderRadius.circular(kBorderRadiusSmall),
                boxShadow: kCardShadow,
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: item.onTap,
                  borderRadius: BorderRadius.circular(kBorderRadiusSmall),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: Text(
                      item.title,
                      style: TextStyle(
                        fontFamily: 'Museum',
                        color: kWhiteColor,
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
              margin: EdgeInsets.only(right: 30.0),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: item.onTap,
                  borderRadius: BorderRadius.circular(kBorderRadiusSmall),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                    child: Text(
                      item.title,
                      style: TextStyle(
                        color: kTextPrimary,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      }).toList(),
    );
  }
}
// 각 기기마다 헤더를 다르게 빌드
class Header extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kSurfaceColor.withOpacity(0.8),
        boxShadow: kCardShadow,
        border: Border(
          bottom: BorderSide(
            color: kPrimaryColor.withOpacity(0.3),
            width: 1,
          ),
        ),
      ),
      child: ScreenHelper(
        desktop: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: buildHeader(),
        ),
        mobile: buildMobileHeader(),
        tablet: buildHeader(),
      ),
    );
  }

  //모바일 환경에서 빌드
  Widget buildMobileHeader(){
    return SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HeaderLogo(),
              GestureDetector(
                onTap: () {
                  Globals.scaffoldKey.currentState?.openEndDrawer();
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: kPrimaryGradient,
                    borderRadius: BorderRadius.circular(kBorderRadiusSmall),
                  ),
                  child: Icon(
                    Icons.menu,
                    color: kWhiteColor,
                    size: 24.0,
                  ),
                )
              )
            ],
          ),
        ));
  }

  Widget buildHeader(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeaderLogo(),
          HeaderRow(),
        ],
      ),
    );
  }
}