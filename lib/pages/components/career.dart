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
    period: '2021.09 ~ 2021.12',
    position: '웹 개발자 (인턴)',
    works: <App>[
      App(
        name: "세종시 SRT 관리자 페이지",
        detail: "Javascript, HTML, CSS",
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
    period: '2023.11 ~',
    position: '앱 개발자',
    works: <App>[
      App(
        name: "녹톡(KNOCKTALK)",
        detail: "Flutter, ASP Classic",
        works: ['앱 유지보수 및 기능개발'],
      ),
      App(
        name: "GOODTV",
        detail: "Flutter, ASP Classic",
        works: ['앱 유지보수 및 기능개발'],
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

/// Career 섹션: 타임라인 구조
/// - 왼쪽: 기간 뱃지 + 카드 높이만큼 이어지는 세로선 (측정 기반)
/// - 오른쪽: 고정 너비로 모든 카드 동일
class Career extends StatefulWidget {
  @override
  State<Career> createState() => _CareerState();
}

class _CareerState extends State<Career> {
  static const _leftColumnWidth = 150.0;
  static const _gapBelowBadge = 12.0;
  static const _rowPaddingBottom = 32.0;
  static const _badgeHeight = 34.0; // padding 8*2 + 텍스트 높이

  final List<GlobalKey> _blockKeys =
      List.generate(careerItem.length, (_) => GlobalKey());
  List<double?> _blockHeights = List.filled(careerItem.length, null);

  void _measureHeights() {
    if (!mounted) return;
    final heights = <double?>[];
    for (var i = 0; i < careerItem.length; i++) {
      final box =
          _blockKeys[i].currentContext?.findRenderObject() as RenderBox?;
      if (box != null && box.hasSize) {
        heights.add(box.size.height);
      } else {
        heights.add(null);
      }
    }
    if (heights.any((h) => h != null)) {
      setState(() => _blockHeights = heights);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _measureHeights());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Globals.careerKey,
      child: ScreenHelper(
        desktop: _buildUi(1000.0, context),
        tablet: _buildUi(760.0, context),
        mobile: _buildUi(MediaQuery.of(context).size.width * .8, context),
      ),
    );
  }

  Widget _buildUi(double width, BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: width),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(height: 40),
            _buildTimeline(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeline(BuildContext context) {
    // 행 간 간격은 카드 Padding(bottom: 32)으로만 둠 → 선이 행 하단에서 다음 행 상단까지 끊기지 않음
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < careerItem.length; i++) _buildTimelineRow(context, i),
      ],
    );
  }

  Widget _buildTimelineRow(BuildContext context, int index) {
    final item = careerItem[index];
    final isLast = index == careerItem.length - 1;
    final cardHeight = _blockHeights[index];
    final isFirst = index == 0;

    // 행 전체 높이 = 카드 + 하단 패딩
    final rowHeight =
        (cardHeight != null ? cardHeight + _rowPaddingBottom : 100.0);
    // 첫 행이 아닐 때: 위쪽 연결선(기간 영역 침범 안 함) = 이전 행 하단~이번 뱃지 상단
    final lineAboveHeight = isFirst ? 0.0 : _rowPaddingBottom;
    // 뱃지 아래 선: 행 하단까지. (위선+뱃지+간격) 제외한 나머지
    final lineBelowHeight = isLast
        ? 0.0
        : (cardHeight != null
            ? (rowHeight - lineAboveHeight - _badgeHeight - _gapBelowBadge)
                .clamp(24.0, double.infinity)
            : 70.0);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: _leftColumnWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (lineAboveHeight > 0)
                _lineSegment(lineAboveHeight),
              _PeriodBadge(period: item.period),
              if (!isLast) ...[
                SizedBox(height: _gapBelowBadge),
                _lineSegment(lineBelowHeight),
              ],
            ],
          ),
        ),
        SizedBox(width: 24),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(bottom: isLast ? 0 : _rowPaddingBottom),
            child: _CareerBlock(
              key: _blockKeys[index],
              item: item,
            ),
          ),
        ),
      ],
    );
  }

  Widget _lineSegment(double height) {
    return SizedBox(
      height: height,
      child: Center(
        child: Container(
          width: 2,
          color: Colors.black26,
        ),
      ),
    );
  }
}

class _PeriodBadge extends StatelessWidget {
  const _PeriodBadge({required this.period});

  final String period;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        period,
        style: TextStyle(
          fontFamily: "Jalnan",
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}

class _CareerBlock extends StatelessWidget {
  const _CareerBlock({Key? key, required this.item}) : super(key: key);

  final CareerItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black12, width: 1.5),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            item.company,
            style: TextStyle(
              color: Colors.black,
              fontFamily: "Jalnan",
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
            softWrap: true,
          ),
          SizedBox(height: 6),
          Text(
            item.position,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Jalnan",
              color: Colors.grey,
              fontSize: 17,
            ),
            softWrap: true,
          ),
          SizedBox(height: 12),
          LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: List<Widget>.generate(
                  item.works.length,
                  (i) {
                    final isLast = i == item.works.length - 1;
                    return Padding(
                      padding: EdgeInsets.only(bottom: isLast ? 0 : 16),
                      child: Container(
                        width: constraints.maxWidth,
                        padding: EdgeInsets.symmetric(
                            horizontal: 12, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          border: Border.all(color: Colors.black12, width: 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: CareerSection(app: item.works[i]),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
