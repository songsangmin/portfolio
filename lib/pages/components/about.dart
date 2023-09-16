import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/globals.dart';
import 'package:portfolio/widgets/horizontal_divide.dart';
import 'package:portfolio/widgets/vertical_divide.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:portfolio/models/about_model.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/screen_helper.dart';

//자기소개 Item
final List<AboutModel> abouts = [
  AboutModel(title: "송상민 / SangMin Song", period: "1997.12.05 / 경기도 안산시" ,detail: "qjsrotkdals@naver.com\nqjsrotkdals@gmail.com", period2: "", detail2: "", period3: '', detail3: '', detail4: '', period4: '', period5: '', detail5: '',),
  AboutModel(title: "Education", period: "2013.03-2016.02",detail: "성포고등학교", period2: "2016.03-2022.02", detail2: "한신대학교 컴퓨터공학\n", detail3: '', period3: '', period4: '', detail4: '', period5: '', detail5: '' ),
  AboutModel(title: "Career", period: "2021.09-2022.12" ,detail: "트라콤 / 인턴", period2: "2023.11.01 ~", detail2: "기독교복음방송 GOODTV", period3: '', detail3: '', period4: '', detail4: '', period5: '', detail5: ''),
  AboutModel(title: "Project", period: "2020.04", detail: "명언, 글귀 어플 '하움'개발 (Flutter)", period2: "2022.08", detail2: "개인 포트폴리오 페이지 개발 (Flutter Web)", period3: "2022.11.01 ~", detail3: "GOODTV, 녹톡(KNOCKTALK) 앱 유지보수 및 기능개발", period4: "2022.02.01 ~", detail4: "다번역성경찬송, 포휴 앱 유지보수 및 기능개발", period5:"" , detail5: ""),
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
          Text("About", // About Title
            style: TextStyle(
              fontFamily: "Museum",
              fontWeight: FontWeight.w900,
              fontSize: 35,
              color: Colors.black,
            ),),
          SizedBox(
            height: 30,
          ),
          ResponsiveWrapper(
            maxWidth: width,
            minWidth: width,
            defaultScale: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border(left: BorderSide(width: 2))
                      ),
                      child: Wrap(
                        children: abouts
                            .map(
                              (about) => Container(
                                decoration: BoxDecoration(
                                  border: Border( right: BorderSide(width: 2),)
                                ),
                            width: constraints.maxWidth / 2.0 - 20.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                HorizontalDivide(color: Colors.black87,space: 3,indent: 40, endIndent: 40,), //가로줄 적용
                                SizedBox(
                                  height: 15,
                                ),
                                Text( //Item Title
                                  about.title,
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontFamily: "Museum",
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text( //Item 기간
                                      about.period,
                                      style: TextStyle(
                                        fontFamily: "Museum",
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                  about.detail,
                                  maxLines: 8,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontFamily: "Jalnan",
                                      fontSize: 20,
                                      height: 1.5,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  about.period2,
                                  style: TextStyle(
                                    fontFamily: "Museum",
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  about.detail2,
                                  maxLines: 8,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontFamily: "Jalnan",
                                      fontSize: 20,
                                      height: 1.5,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                //HorizontalDivide(color: Colors.black45,space: 3,),
                                SizedBox(
                                  height: 20.0,
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
        ],
      ),
    );
  }
}