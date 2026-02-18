import 'package:flutter/material.dart';
import 'package:portfolio/utils/globals.dart';
import 'package:portfolio/models/about_model.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/screen_helper.dart';

//자기소개 Item
final List<AboutModel> abouts = [
  AboutModel(title: "송상민 / SangMin Song", period: "1997.12.05 / 경기도 안산시" ,detail: "qjsrotkdals@naver.com / qjsrotkdals@gmail.com", period2: "", detail2: "", period3: '', detail3: '', detail4: '', period4: '', period5: '', detail5: '',),
  AboutModel(title: "Education", period: "2013.03 ~ 2016.02",detail: "성포고등학교", period2: "2016.03 ~ 2022.02", detail2: "한신대학교 컴퓨터공학\n", detail3: '', period3: '', period4: '', detail4: '', period5: '', detail5: '' ),
  AboutModel(title: "Career", period: "2021.09 ~ 2022.12" ,detail: "트라콤 / 인턴", period2: "2023.11 ~ 2026.04", detail2: "기독교복음방송 GOODTV", period3: '', detail3: '', period4: '', detail4: '', period5: '', detail5: ''),
  AboutModel(title: "Project", period: "2020.04", detail: "명언, 글귀 어플 '하움'개발 (Flutter)", period2: "2022.08", detail2: "개인 포트폴리오 페이지 개발 (Flutter Web)", period3: "2022.11.01 ~", detail3: "GOODTV, 녹톡(KNOCKTALK) 앱 유지보수 및 기능개발", period4: "2022.02.01 ~", detail4: "다번역성경찬송, 포휴 앱 유지보수 및 기능개발", period5:"" , detail5: ""),
  AboutModel(title: "Certificate", period: "2022.09", detail: "정보처리기사", period2: "", detail2: "", period3: '', detail3: '', period4: '', detail4: '', period5: '', detail5: ''),
];

class About extends StatefulWidget {
  const About({
    Key? key,
    required this.scrollController,
    required this.scrollContentKey,
  }) : super(key: key);

  final ScrollController scrollController;
  final GlobalKey scrollContentKey;

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  late List<GlobalKey> _cardKeys;
  late List<double> _opacities;
  bool _listenerAttached = false;
  bool _updateScheduled = false;

  @override
  void initState() {
    super.initState();
    _cardKeys = List.generate(abouts.length, (_) => GlobalKey());
    _opacities = List.filled(abouts.length, 0.0);
    // 첫 레이아웃이 끝난 뒤에만 리스너 등록 + 1회 갱신 (무한 레이아웃 방지)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || _listenerAttached) return;
      _listenerAttached = true;
      widget.scrollController.addListener(_onScroll);
      _updateOpacities();
    });
  }

  @override
  void dispose() {
    if (_listenerAttached) {
      widget.scrollController.removeListener(_onScroll);
    }
    super.dispose();
  }

  void _onScroll() {
    // 프레임당 한 번만 갱신해서 무한 setState 방지
    if (_updateScheduled) return;
    _updateScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateScheduled = false;
      if (mounted) _updateOpacities();
    });
  }

  void _updateOpacities() {
    if (!mounted) return;
    final contentBox = widget.scrollContentKey.currentContext?.findRenderObject() as RenderBox?;
    if (contentBox == null || !contentBox.hasSize) return;

    final scrollOffset = widget.scrollController.offset;
    final viewportHeight = widget.scrollController.position.viewportDimension;

    bool changed = false;
    for (var i = 0; i < abouts.length; i++) {
      final key = _cardKeys[i];
      final cardBox = key.currentContext?.findRenderObject() as RenderBox?;
      if (cardBox == null || !cardBox.hasSize) continue;

      try {
        final cardOffset = cardBox.localToGlobal(Offset.zero, ancestor: contentBox);
        final cardY = cardOffset.dy;
        final cardHeight = cardBox.size.height;

        final viewportTop = scrollOffset;
        final viewportBottom = scrollOffset + viewportHeight;
        final cardTop = cardY;
        final cardBottom = cardY + cardHeight;

        final visibleTop = cardTop.clamp(viewportTop, viewportBottom);
        final visibleBottom = cardBottom.clamp(viewportTop, viewportBottom);
        final visibleHeight = (visibleBottom - visibleTop).clamp(0.0, cardHeight);
        final opacity = (visibleHeight / cardHeight).clamp(0.0, 1.0);

        if ((_opacities[i] - opacity).abs() > 0.02) {
          _opacities[i] = opacity;
          changed = true;
        }
      } catch (_) {}
    }
    if (changed && mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Globals.aboutKey,
      alignment: Alignment.center,
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth),
        tablet: _buildUi(kTabletMaxWidth),
        mobile: _buildUi(getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(double width) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            "About",
            style: TextStyle(
              fontFamily: "Museum",
              fontWeight: FontWeight.w900,
              fontSize: 35,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 30),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: width, minWidth: width),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: abouts.asMap().entries.map((entry) {
                final index = entry.key;
                final about = entry.value;
                return AnimatedOpacity(
                  duration: const Duration(milliseconds: 180),
                  opacity: _opacities[index].clamp(0.0, 1.0),
                  child: Container(
                    key: _cardKeys[index],
                    child: _AboutCard(about: about),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _AboutCard extends StatelessWidget {
  const _AboutCard({Key? key, required this.about}) : super(key: key);

  final AboutModel about;

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[];

    final isFirstCard = about.title.startsWith("송상민");
    rows.add(_buildRow(about.period, about.detail, detailColor: isFirstCard ? Colors.black : Colors.black54));
    if (about.period2.isNotEmpty || about.detail2.isNotEmpty) {
      rows.add(SizedBox(height: 12));
      rows.add(_buildRow(about.period2, about.detail2, detailColor: isFirstCard ? Colors.black : Colors.black54));
    }
    if (about.period3.isNotEmpty || about.detail3.isNotEmpty) {
      rows.add(SizedBox(height: 12));
      rows.add(_buildRow(about.period3, about.detail3, detailColor: isFirstCard ? Colors.black : Colors.black54));
    }
    if (about.period4.isNotEmpty || about.detail4.isNotEmpty) {
      rows.add(SizedBox(height: 12));
      rows.add(_buildRow(about.period4, about.detail4, detailColor: isFirstCard ? Colors.black : Colors.black54));
    }
    if (about.period5.isNotEmpty || about.detail5.isNotEmpty) {
      rows.add(SizedBox(height: 12));
      rows.add(_buildRow(about.period5, about.detail5, detailColor: isFirstCard ? Colors.black : Colors.black54));
    }

    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black12, width: 1.5),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              about.title,
              style: TextStyle(
                fontSize: 24,
                fontFamily: "Museum",
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            Divider(height: 1, thickness: 1, color: Colors.black87),
            SizedBox(height: 16),
            ...rows,
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String period, String detail, {Color detailColor = Colors.black54}) {
    if (period.isEmpty && detail.isEmpty) return SizedBox.shrink();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 220,
          child: Text(
            period,
            style: TextStyle(
              fontFamily: "Museum",
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Text(
            detail,
            maxLines: 8,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: detailColor,
              fontFamily: "Jalnan",
              fontSize: 16,
              height: 1.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
