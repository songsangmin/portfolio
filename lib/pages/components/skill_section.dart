import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio/models/skill.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/screen_helper.dart';
import 'package:portfolio/utils/globals.dart';

final List<Color> _pastelBarColors = [
  Color(0xFFB5EAD7),
  Color(0xFFC7CEEA),
  Color(0xFFFFDAC1),
  Color(0xFFFFF3B0),
  Color(0xFFE2F0CB),
  Color(0xFFD4A5A5),
  Color(0xFFB8D4E3),
  Color(0xFFF9C5D1),
  Color(0xFFCFE1B9),
];

List<Skill> skills = [
  Skill(skill: "Dart", percentage: 85),
  Skill(skill: "Java", percentage: 70),
  Skill(skill: "Swift", percentage: 50),
  Skill(skill: "MariaDB, MYSQL, MSSQL", percentage: 80),
  Skill(skill: "Firebase", percentage: 80),
  Skill(skill: "react-native", percentage: 80),
  Skill(skill: "PHP", percentage: 70),
  Skill(skill: "JAVASCRIPT", percentage: 70),
  Skill(skill: "ASP Classic", percentage: 70),
];

class SkillSection extends StatefulWidget {
  const SkillSection({
    Key? key,
    this.scrollController,
    this.scrollContentKey,
  }) : super(key: key);

  final ScrollController? scrollController;
  final GlobalKey? scrollContentKey;

  @override
  State<SkillSection> createState() => _SkillSectionState();
}

class _SkillSectionState extends State<SkillSection> {
  double _animT = 0.0;
  Timer? _timer;
  bool _started = false;
  static const _durationMs = 900;

  void _startAnim() {
    if (_started) return;
    _started = true;

    final start = DateTime.now().millisecondsSinceEpoch;
    _timer = Timer.periodic(const Duration(milliseconds: 16), (_) {
      if (!mounted) return;
      final elapsed = DateTime.now().millisecondsSinceEpoch - start;
      final linearT = (elapsed / _durationMs).clamp(0.0, 1.0);
      final t = Curves.easeOutCubic.transform(linearT);
      if (linearT >= 1.0) {
        _timer?.cancel();
        _timer = null;
      }
      setState(() => _animT = t);
    });
  }

  void _maybeStartIfVisible() {
    if (_started || !mounted) return;

    final ctx = Globals.skillKey.currentContext;
    if (ctx == null) return;

    final renderObject = ctx.findRenderObject();
    if (renderObject is! RenderBox || !renderObject.hasSize) return;

    final pos = renderObject.localToGlobal(Offset.zero);
    final size = renderObject.size;
    final screenH = MediaQuery.of(context).size.height;

    // 화면에 일정 부분이라도 보이면 애니메이션 시작
    final visible = pos.dy < screenH * 0.9 && (pos.dy + size.height) > screenH * 0.1;
    if (visible) _startAnim();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _maybeStartIfVisible();
      widget.scrollController?.addListener(_maybeStartIfVisible);
    });
  }

  @override
  void dispose() {
    widget.scrollController?.removeListener(_maybeStartIfVisible);
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Globals.skillKey,
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth, context),
        tablet: _buildUi(kTabletMaxWidth, context),
        mobile: _buildUi(getMobileMaxWidth(context), context),
      ),
    );
  }

  Widget _buildUi(double width, BuildContext context) {
    final isMobile = ScreenHelper.isMobile(context);
    final sortedSkills = [...skills]..sort((a, b) => b.percentage.compareTo(a.percentage));
    final safeWidth = width.clamp(1.0, double.infinity);
    // 데스크톱/태블릿: Row에서 이미지(flex 2) + 간격 50 + 바(flex 4) → 바 영역 너비 ≈ (width - 50) * 4/6
    final barColumnWidth = isMobile ? safeWidth : (safeWidth - 50) * (4 / 6);

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: safeWidth),
        child: isMobile
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("assets/skill.png", width: 300.0),
                  SizedBox(height: 30.0),
                  _buildBarsSection(sortedSkills, barColumnWidth),
                ],
              )
            : Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Image.asset("assets/skill.png", width: 300.0),
                  ),
                  SizedBox(width: 50.0),
                  Expanded(
                    flex: 4,
                    child: _buildBarsSection(sortedSkills, barColumnWidth),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildBarsSection(List<Skill> sortedSkills, double columnWidth) {
    const reserved = 90.0;
    final barArea = (columnWidth - reserved).clamp(10.0, double.infinity);
    return _buildBarsContent(sortedSkills, barArea, _animT);
  }

  Widget _buildBarsContent(List<Skill> sortedSkills, double barArea, double t) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "SKILLS",
          style: TextStyle(
            fontFamily: "Museum",
            color: Colors.black,
            fontWeight: FontWeight.w900,
            fontSize: 28.0,
            height: 1.3,
          ),
        ),
        SizedBox(height: 15.0),
        ...sortedSkills.asMap().entries.map((entry) {
          final i = entry.key;
          final s = entry.value;
          final color = _pastelBarColors[i % _pastelBarColors.length];
          // 막대별로 딜레이를 주어 순차적으로 늘어나는 효과 (t: 0→1 구간에서 스태거)
          const stagger = 0.04;
          final growthSpan = (1.0 - (sortedSkills.length - 1) * stagger).clamp(0.05, 1.0);
          final barT = ((t - i * stagger) / growthSpan).clamp(0.0, 1.0);
          final w = barArea * (s.percentage / 100) * barT;
          final emptyW = (barArea - w).clamp(0.0, double.infinity);
          return Container(
            margin: EdgeInsets.only(bottom: 15.0),
            child: Row(
              children: [
                SizedBox(
                  width: w.clamp(0.0, double.infinity),
                  child: Container(
                    padding: EdgeInsets.only(left: 10.0),
                    alignment: Alignment.centerLeft,
                    height: 38.0,
                    child: Text(
                      s.skill,
                      style: TextStyle(
                        fontFamily: "Museum",
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.horizontal(left: Radius.circular(4)),
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                SizedBox(
                  width: emptyW.clamp(0.0, double.infinity),
                  child: Divider(color: Colors.black12, thickness: 2),
                ),
                SizedBox(width: 10.0),
                SizedBox(
                  width: 44,
                  child: Text(
                    "${s.percentage}%",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
