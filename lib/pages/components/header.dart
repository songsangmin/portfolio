import 'package:flutter/material.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
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
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      height: 50.0,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    // 웹에서 페이지 새로고침은 JavaScript를 통해 처리
                    // Flutter 웹에서는 Navigator를 사용하여 홈으로 이동
                    Scrollable.ensureVisible(
                      Globals.homeKey.currentContext!,
                      duration: Duration(seconds: 1),
                    );
                  },
                  child: RichText(
                    textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                        TextSpan(
                        text: "<Sangmin Song/>",
                        style: TextStyle(
                          fontFamily: 'Jalnan',
                          color: Colors.black,
                          fontSize: 24.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      ]
                  ),
                )
            )
    ),
          ],
        ));
  }

}

//헤더 메뉴 구성
class HeaderRow extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ResponsiveVisibility(
      visible: false,
      visibleWhen: [
        Condition.largerThan(name: MOBILE),
      ],
      child: Row(
        children: headerItems.map((item) => item.isButton ? MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Container(
            decoration: BoxDecoration(
              color: kDangerColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
            child: TextButton(
              onPressed: item.onTap,
              child: Text(
                item.title,
                style: TextStyle(
                  fontFamily: 'Museum',
                  color: Colors.black,
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ) :
            MouseRegion(cursor: SystemMouseCursors.click,
            child: Container(
              margin: EdgeInsets.only(right: 30.0),
              child: GestureDetector(
                onTap: item.onTap,
                child: Text(
                  item.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),)
        ).toList(),
      ),
    );
  }

}
// 각 기기마다 헤더를 다르게 빌드
class Header extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black, width: 2))
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
                child: Icon(
                  Icons.import_contacts_sharp,
                  color: Colors.white,
                  size: 28.0,
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