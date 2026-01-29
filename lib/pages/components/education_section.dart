import 'package:flutter/material.dart';
import 'package:portfolio/models/education.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/screen_helper.dart';
import 'package:url_launcher/url_launcher.dart';

final List<Education> educationList = [
  Education(
    description:
    "명언 어플(하움)에 대하여 개발부터 유지 보수까지 혼자서 진행하고 유지하고 있습니다. \nGetx, Provider를 통한 상태 관리에 능숙하며, 출시된 Flutter 3.0에 대한 "
        "이해를 위해 공식문서, 공식 유튜브, 자료들을 통하여 지속적인 공부를 진행하고 있습니다.\nJava, Swift를 이용하여 앱위젯, 홈위젯 관리가 가능합니다.",
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
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: width,
          minWidth: width,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                gradient: kPrimaryGradient,
                borderRadius: BorderRadius.circular(kBorderRadius),
                boxShadow: kCardShadow,
              ),
              child: Text(
                "Education & Stack",
                style: TextStyle(
                  fontFamily: "Museum",
                  fontWeight: FontWeight.w900,
                  fontSize: 35,
                  color: kWhiteColor,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            SizedBox(height: 40.0),
            LayoutBuilder(
              builder: (context, constraints) {
                return Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: educationList
                      .map(
                        (education) => MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () async {
                              final uri = Uri.parse(education.linkName);
                              if (await canLaunchUrl(uri)) {
                                await launchUrl(uri, mode: LaunchMode.externalApplication);
                              }
                            },
                            child: Container(
                              width: constraints.maxWidth / 2.0 - 10.0,
                              padding: EdgeInsets.all(24),
                              decoration: BoxDecoration(
                                color: kSurfaceColor,
                                borderRadius: BorderRadius.circular(kBorderRadius),
                                boxShadow: kCardShadow,
                                border: Border.all(
                                  color: kPrimaryColor.withValues(alpha: 0.2),
                                  width: 1,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          gradient: kPrimaryGradient,
                                          borderRadius: BorderRadius.circular(kBorderRadiusSmall),
                                        ),
                                        child: Image.asset(
                                          education.imagePath,
                                          width: 32.0,
                                        ),
                                      ),
                                      SizedBox(width: 12.0),
                                      Expanded(
                                        child: Text(
                                          education.period,
                                          style: TextStyle(
                                            fontFamily: "Museum",
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w700,
                                            color: kTextPrimary,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16.0),
                                  Text(
                                    education.description,
                                    maxLines: 8,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: kTextSecondary,
                                      fontFamily: "Jalnan",
                                      fontSize: 14,
                                      height: 1.6,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 16.0),
                                  Row(
                                    children: [
                                      Text(
                                        "Learn more",
                                        style: TextStyle(
                                          color: kPrimaryColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(width: 4),
                                      Icon(
                                        Icons.arrow_forward,
                                        size: 16,
                                        color: kPrimaryColor,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}