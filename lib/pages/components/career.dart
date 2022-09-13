import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/models/career_item.dart';
import 'package:portfolio/pages/components/career_items.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/screen_helper.dart';
import 'package:timelines/timelines.dart';

import '../../models/app_model.dart';
import '../../utils/globals.dart';

//이력서 Item
final List<CareerItem> careerItem = [
  CareerItem(
    company: '트라콤',
    period: '2021.09-2021.12',
    position: '웹 개발자 (인턴)',
    works: <App>[ //works
      App(
      name: "",
      detail: "",
      works: [
      '통계 페이지 설계 및 개발',
      '단위 테스트 및 통합 테스트 진행',
      '오류 수정 및 안정화등의 유지보수',
        ],
      ),
    ],
  ),
];

class Career extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: Globals.careerKey,
      child: ScreenHelper(
        desktop: _buildUi(1000.0),
        tablet: _buildUi(760.0),
        mobile: _buildUi(MediaQuery.of(context).size.width * .8),
      ),
    );
  }

  Widget _buildUi(double width) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ResponsiveWrapper(
            maxWidth: width,
            minWidth: width,
            defaultScale: false,
            child: Column(
              children: [
                Text(
                  "Career",
                  style: TextStyle(
                    fontFamily: "Museum",
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 35.0,
                  ),
                ),
                SizedBox(height: 50,),
                FixedTimeline.tileBuilder(
                  theme: TimelineThemeData(
                    nodePosition: ScreenHelper.isMobile(context) ? 0.0 : 0.5,
                    color: Colors.black,
                    indicatorTheme: IndicatorThemeData(
                      position: 0,
                      size: 30.0,
                    ),
                    connectorTheme: ConnectorThemeData(
                      thickness: 4,
                    ),
                  ),
                  builder: TimelineTileBuilder.connected(
                    contentsAlign: ScreenHelper.isMobile(context)
                        ? ContentsAlign.basic
                        : ContentsAlign.alternating,
                      connectionDirection: ConnectionDirection.before,
                      itemCount: careerItem.length + 1,
                    contentsBuilder: (_, int index) {
                      if(index == careerItem.length) return null;
                      return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          if(ScreenHelper.isDesktop(context))
                            Row(
                              children: [
                                Text(
                                careerItem[index].company,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Jalnan",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28,
                                ),
                              ),
                                SizedBox(width: 10,),
                                Text(
                                  careerItem[index].period,
                                  style: TextStyle(
                                      fontFamily: "Jalnan",
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey
                                  ),
                                ),

                              ],
                            )
                          else
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  careerItem[index].company,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Jalnan",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 28,
                                  ),
                                ),
                                Text(
                                  careerItem[index].period,
                                  style: TextStyle(
                                      fontFamily: "Jalnan",
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey
                                  ),
                                ),
                              ],
                            ),
                          Text(
                            careerItem[index].position,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Jalnan",
                              color: Colors.grey,
                              fontSize: 20
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List<CareerSection>.generate(
                              careerItem[index].works.length,
                                (int index2){
                                return CareerSection(
                                  app: careerItem[index].works[index2],
                                );
                                }
                            ),
                          )
                        ],
                      ),
                      );
                    },
                    indicatorBuilder: (_, int index){
                      return OutlinedDotIndicator(
                        borderWidth: 4,
                      );
                    },
                    connectorBuilder: (_, int index, ___) => SolidLineConnector(
                      thickness: 4,
                    )
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}