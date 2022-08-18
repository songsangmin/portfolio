import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:portfolio/models/education.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/screen_helper.dart';
import 'dart:html' as html;

final List<Education> educationList = [
  Education(
    description:
    "명언 어플(하움)에 대하여 개발부터 유지 보수까지 혼자서 진행하고 유지하고 있습니다. \nGetx, Provider를 통한 상태 관리에 능숙하며, 출시된 Flutter 3.0에 대한 "
        "이해를 위해 공식문서, 공식 유튜브, 자료들을 통하여 지속적인 공부를 진행하고 있습니다.",
    linkName: "https://flutter-ko.dev/",
    period: "Flutter",
    imagePath: "assets/flutter.png",
  ),
  Education(
    description:
    "명언 어플, 클론 앱, 개인 프로젝트로 애플리케이션을 개발할 때 Firebase를 사용하였습니다.\n그렇기에 Firebase의 Auntentication, Realtime DataBase, Cloud Messaging, Analytics"
        "Dynamic Links, AdMob을 능숙하게 사용할 줄 알며, 이 외의 기능은 어려움 없이 다룰 수 있을 정도입니다.",
    linkName: "https://firebase.google.com/?hl=ko",
    period: "Firebase",
    imagePath: "assets/firebase.png",
  ),
  Education(
    description:
    "4개월의 인턴 기간동안 진행했던 프로젝트와 명언어플의 홈페이지를 만들 때 MariaDB를 사용했습니다.\nSQL문을 통해 자유롭게 데이터를 다룰 수 있으며 함수와 프로시저를 어렵지 않게 사용 가능할 정도 입니다.",
    linkName: "https://mariadb.com/ko/",
    period: "MariaDB",
    imagePath: "assets/mariadb.png",
  ),
  Education(
    description:
    "인턴 기간동안 팀원들과의 협업을 위해 Git을 사용하고 난 뒤 중요성을 깨닫고 Git에 익숙해지고 있습니다.\nGit을 활용한지 얼마 되지않아 능숙하진 못하지만 꾸준히 공부 중에 있습니다.",
    linkName: "https://github.com/",
    period: "Github",
    imagePath: "assets/github.png",
  ),
];

class EducationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: _buildUi(1000.0),
        tablet: _buildUi(760.0),
        mobile: _buildUi(MediaQuery.of(context).size.width * .8),
      ),
    );
  }

  Widget _buildUi(double width) {
    return Container(
      alignment: Alignment.center,
      child: ResponsiveWrapper(
        maxWidth: width,
        minWidth: width,
        defaultScale: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Text(
            //   "EDUCATION",
            //   style: TextStyle(
            //     fontFamily: "Museum",
            //     color: Colors.white,
            //     fontWeight: FontWeight.w900,
            //     fontSize: 30.0,
            //     height: 1.3,
            //   ),
            // ),
            // SizedBox(
            //   height: 5.0,
            // ),
            // Wrap(
            //   children: [
            //     Container(
            //       constraints: BoxConstraints(maxWidth: 400.0),
            //       child: Text(
            //         "A full stack all round developer that does all the job he needs to do at all times. Actually this is a false statement",
            //         style: TextStyle(
            //           color: Colors.white,
            //           height: 1.5,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            SizedBox(
              height: 40.0,
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  child: Wrap(
                    spacing: 20.0,
                    runSpacing: 20.0,
                    children: educationList
                        .map(
                          (education) => Container(
                        width: constraints.maxWidth / 2.0 - 20.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text(
                            //   education.period,
                            //   style: GoogleFonts.oswald(
                            //     color: Colors.white,
                            //     fontWeight: FontWeight.w900,
                            //     fontSize: 30.0,
                            //   ),
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  education.imagePath,
                                  width: 40.0,
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Text(
                                  education.period,
                                  style: TextStyle(
                                    fontFamily: "Museum",
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              education.description,
                              maxLines: 8,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: kCaptionColor,
                                fontFamily: "Jalnan",
                                fontSize: 15,
                                height: 1.5,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {
                                  html.window.open(education.linkName,"_blank");
                                },
                                child: Text(
                                  "Go ${education.period} Main Site ->",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40.0,
                            )
                          ],
                        ),
                      ),
                    )
                        .toList(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}