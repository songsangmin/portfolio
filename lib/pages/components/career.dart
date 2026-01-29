import 'package:flutter/material.dart';
import 'package:portfolio/models/career_item.dart';
import 'package:portfolio/pages/components/career_items.dart';
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
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    gradient: kPrimaryGradient,
                    borderRadius: BorderRadius.circular(kBorderRadius),
                    boxShadow: kCardShadow,
                  ),
                  child: Text(
                    "Career",
                    style: TextStyle(
                      fontFamily: "Museum",
                      color: kWhiteColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 35.0,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                SizedBox(height: 50),
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

        return Container(
          margin: EdgeInsets.only(bottom: 32),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 인디케이터와 연결선
              Column(
                children: [
                  Container(
                    width: indicatorSize,
                    height: indicatorSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: kPrimaryGradient,
                      boxShadow: kCardShadow,
                    ),
                  ),
                  if (!isLast)
                    Container(
                      width: connectorThickness,
                      height: 120,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            kPrimaryColor,
                            kPrimaryColor.withOpacity(0.3),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(width: 24.0),
              // 콘텐츠
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: kSurfaceColor,
                    borderRadius: BorderRadius.circular(kBorderRadius),
                    boxShadow: kCardShadow,
                    border: Border.all(
                      color: kPrimaryColor.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              careerItem[index].company,
                              style: TextStyle(
                                color: kTextPrimary,
                                fontFamily: "Jalnan",
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              gradient: kPrimaryGradient,
                              borderRadius: BorderRadius.circular(kBorderRadiusSmall),
                            ),
                            child: Text(
                              careerItem[index].period,
                              style: TextStyle(
                                fontFamily: "Jalnan",
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: kWhiteColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        careerItem[index].position,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: "Jalnan",
                          color: kPrimaryColor,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 16),
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
            ],
          ),
        );
      },
    );
  }
}