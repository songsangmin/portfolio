import 'package:flutter/material.dart';
import 'package:portfolio/models/career_item.dart';
import 'package:portfolio/pages/components/career_items.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:portfolio/utils/screen_helper.dart';
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
          return ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: width,
              minWidth: width,
            ),
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
                // 커스텀 타임라인 위젯
                _buildCustomTimeline(context)
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCustomTimeline(BuildContext context) {
    final bool isMobile = ScreenHelper.isMobile(context);
    final double nodePosition = isMobile ? 0.0 : 0.5;
    final double indicatorSize = 30.0;
    final double connectorThickness = 4.0;

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: careerItem.length,
      itemBuilder: (context, index) {
        final bool isLast = index == careerItem.length - 1;
        final bool isAlternating = !isMobile && index % 2 == 1;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 왼쪽 또는 중앙에 인디케이터 배치
            if (nodePosition == 0.0 || !isAlternating)
              SizedBox(width: nodePosition == 0.0 ? 0 : (MediaQuery.of(context).size.width * 0.5 - indicatorSize / 2)),
            // 인디케이터와 연결선
            Column(
              children: [
                Container(
                  width: indicatorSize,
                  height: indicatorSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black, width: 4),
                    color: Colors.white,
                  ),
                ),
                if (!isLast)
                  Container(
                    width: connectorThickness,
                    height: 100,
                    color: Colors.black,
                  ),
              ],
            ),
            SizedBox(width: 15.0),
            // 콘텐츠
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    if (ScreenHelper.isDesktop(context))
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
                          SizedBox(width: 10),
                          Text(
                            careerItem[index].period,
                            style: TextStyle(
                              fontFamily: "Jalnan",
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
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
                              color: Colors.grey,
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
                        fontSize: 20,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List<CareerSection>.generate(
                        careerItem[index].works.length,
                        (int index2) {
                          return CareerSection(
                            app: careerItem[index].works[index2],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // 오른쪽에 인디케이터 배치 (alternating 모드)
            if (nodePosition == 0.5 && isAlternating)
              SizedBox(width: MediaQuery.of(context).size.width * 0.5 - indicatorSize / 2),
          ],
        );
      },
    );
  }
}