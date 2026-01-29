import 'package:flutter/material.dart';
import 'package:portfolio/utils/globals.dart';
import 'package:portfolio/widgets/horizontal_divide.dart';
import 'package:portfolio/models/about_model.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/screen_helper.dart';

//자기소개 Item
final List<AboutModel> abouts = [
  AboutModel(title: "송상민 / SangMin Song", period: "1997.12.05 / 경기도 안산시" ,detail: "qjsrotkdals@naver.com\nqjsrotkdals@gmail.com", period2: "", detail2: "", period3: '', detail3: '', detail4: '', period4: '', period5: '', detail5: '',),
  AboutModel(title: "Education", period: "2013.03-2016.02",detail: "성포고등학교", period2: "2016.03-2022.02", detail2: "한신대학교 컴퓨터공학\n", detail3: '', period3: '', period4: '', detail4: '', period5: '', detail5: '' ),
  AboutModel(title: "Career", period: "2021.09-2022.12" ,detail: "트라콤 / 인턴", period2: "2023.11.01 ~ 2026.04.01", detail2: "기독교복음방송 GOODTV", period3: '', detail3: '', period4: '', detail4: '', period5: '', detail5: ''),
  AboutModel(title: "Project", period: "2020.04", detail: "명언, 글귀 어플 '하움'개발 (Flutter)", period2: "2022.08", detail2: "개인 포트폴리오 페이지 개발 (Flutter Web)", period3: "2022.11.01 ~", detail3: "GOODTV, 녹톡(KNOCKTALK) Flutter 앱 유지보수 및 기능개발", period4: "2022.11.01 ~", detail4: "다번역성경찬송, 포휴 React Native 앱 유지보수 및 기능개발", period5:"" , detail5: ""),
  AboutModel(title: "Certificate", period: "2022.09", detail: "정보처리기사", period2: "", detail2: "", period3: '', detail3: '', period4: '', detail4: '', period5: '', detail5: ''),
];

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: Globals.aboutKey,
      alignment: Alignment.center,
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth, context),
        tablet: _buildUi(kTabletMaxWidth, context),
        mobile: _buildUi(getMobileMaxWidth(context), context),
      ),
    );
  }

  //About UI
  Widget _buildUi(double width, BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              gradient: kPrimaryGradient,
              borderRadius: BorderRadius.circular(kBorderRadius),
              boxShadow: kCardShadow,
            ),
            child: Text(
              "About",
              style: TextStyle(
                fontFamily: "Museum",
                fontWeight: FontWeight.w900,
                fontSize: 35,
                color: kWhiteColor,
                letterSpacing: 1.2,
              ),
            ),
          ),
          SizedBox(height: 40),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: width,
              minWidth: width,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: abouts
                          .map(
                            (about) => Container(
                              width: constraints.maxWidth / 2.0 - 10.0,
                              decoration: BoxDecoration(
                                color: kSurfaceColor,
                                borderRadius: BorderRadius.circular(kBorderRadius),
                                boxShadow: kCardShadow,
                                border: Border.all(
                                  color: kPrimaryColor.withOpacity(0.2),
                                  width: 1,
                                ),
                              ),
                              padding: EdgeInsets.all(24),
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    gradient: kPrimaryGradient,
                                    borderRadius: BorderRadius.circular(kBorderRadiusSmall),
                                  ),
                                  child: Text(
                                    about.title,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "Museum",
                                      fontWeight: FontWeight.w700,
                                      color: kWhiteColor,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16),
                                if (about.period.isNotEmpty) ...[
                                  Text(
                                    about.period,
                                    style: TextStyle(
                                      fontFamily: "Museum",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                ],
                                Text(
                                  about.detail,
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
                                if (about.period2.isNotEmpty) ...[
                                  SizedBox(height: 16),
                                  Text(
                                    about.period2,
                                    style: TextStyle(
                                      fontFamily: "Museum",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    about.detail2,
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
                                ],
                                if (about.period3.isNotEmpty) ...[
                                  SizedBox(height: 16),
                                  Text(
                                    about.period3,
                                    style: TextStyle(
                                      fontFamily: "Museum",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    about.detail3,
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
                                ],
                                if (about.period4.isNotEmpty) ...[
                                  SizedBox(height: 16),
                                  Text(
                                    about.period4,
                                    style: TextStyle(
                                      fontFamily: "Museum",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    about.detail4,
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
                                ],
                              ],
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
        ],
      ),
    );
  }
}