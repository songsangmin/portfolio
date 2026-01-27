import 'package:flutter/material.dart';
import 'package:portfolio/models/career_item.dart';
import 'package:portfolio/pages/components/career_items.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
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
    works: <App>[
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
  CareerItem(
    company: '기독교복음방송 GOODTV',
    period: '2023.11.01 ~',
    position: '앱 개발자',
    works: <App>[
      App(
        name: "녹톡(KNOCKTALK)",
        detail: "Flutter, ASP Classic",
        works: [
          '앱 유지보수 및 기능개발',
        ],
      ),
      App(
        name: "GOODTV",
        detail: "Flutter, ASP Classic",
        works: [
          '앱 유지보수 및 기능개발',
        ],
      ),
      App(
        name: "바이블 애플",
        detail: "React Native, ASP Classic",
        works: [
          '앱 유지보수 및 기능개발',
          '프로젝트 관리 및 협업',
          '데이터 분석 및 보고서 작성',
          '배포 후 안정화',
        ],
      ),
      App(
        name: "포휴",
        detail: "React Native, PHP",
        works: [
          '앱 유지보수 및 기능개발',
          '프로젝트 관리 및 협업',
          '데이터 분석 및 보고서 작성',
          '배포 후 안정화',
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
              children: [ //최상단 제목
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
                FixedTimeline.tileBuilder( //타임라인위젯
                  theme: TimelineThemeData(
                    nodePosition: ScreenHelper.isMobile(context) ? 0.0 : 0.5,
                    color: Colors.black,
                    indicatorTheme: IndicatorThemeData( //노드 테마
                      position: 0,
                      size: 30.0,
                    ),
                    connectorTheme: ConnectorThemeData( //연결선 테마
                      thickness: 4,
                    ),
                  ),
                  builder: TimelineTileBuilder.connected( //아이템 개수만큼 노드 늘리기
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
                          if(ScreenHelper.isDesktop(context)) //데스크탑 일시 회사와 기간 설정
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
                      return OutlinedDotIndicator( //점 바깥선 테두리 두께
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