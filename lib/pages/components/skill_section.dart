import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:portfolio/models/skill.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/screen_helper.dart';
import 'package:portfolio/utils/globals.dart';

//todo 언제든지 실력이 늘면 바꿀 수 있도록
List<Skill> skills = [
  Skill(
    skill: "Dart",
    percentage: 85,
  ),
  Skill(
    skill: "Java",
    percentage: 60,
  ),
  Skill(
    skill: "Swift",
    percentage: 40,
  ),
  Skill(
    skill: "MariaDB, MYSQL, MSSQL",
    percentage: 85,
  ),
  Skill(
    skill: "Firebase",
    percentage: 70,
  ),
  Skill(
    skill: "react-native",
    percentage: 60,
  ),
  Skill(
    skill: "PHP",
    percentage: 55,
  ),
  Skill(
    skill: "JAVASCRIPT",
    percentage: 70,
  )
];

class SkillSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: Globals.skillKey,
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth),
        tablet: _buildUi(kTabletMaxWidth),
        mobile: _buildUi(getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(double width) {
    return Center(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: width,
              minWidth: width,
            ),
            child: Flex(
              direction: ScreenHelper.isMobile(context)
                  ? Axis.vertical
                  : Axis.horizontal,
              children: [
                Expanded(
                  flex: ScreenHelper.isMobile(context) ? 0 : 2,
                  child: Image.asset(
                    "assets/skill.png",
                    width: 300.0,
                  ),
                ),
                SizedBox(
                  width: 50.0,
                ),
                Expanded(
                  flex: ScreenHelper.isMobile(context) ? 0 : 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        decoration: BoxDecoration(
                          gradient: kPrimaryGradient,
                          borderRadius: BorderRadius.circular(kBorderRadius),
                          boxShadow: kCardShadow,
                        ),
                        child: Text(
                          "SKILLS",
                          style: TextStyle(
                            fontFamily: "Museum",
                            color: kWhiteColor,
                            fontWeight: FontWeight.w900,
                            fontSize: 28.0,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        "제가 사용하고 사용할 수 있는 Skill들의 숙련도 입니다.",
                        style: TextStyle(
                          fontFamily: "Jalnan",
                          color: kTextSecondary,
                          height: 1.5,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(height: 24.0),
                      Column(
                        children: skills
                            .map(
                              (skill) => Container(
                            margin: EdgeInsets.only(bottom: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      skill.skill,
                                      style: TextStyle(
                                        fontFamily: "Museum",
                                        color: kTextPrimary,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      "${skill.percentage}%",
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Container(
                                  height: 12.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: kSurfaceColor,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6),
                                    child: TweenAnimationBuilder<double>(
                                      tween: Tween<double>(begin: 0, end: skill.percentage / 100),
                                      duration: Duration(milliseconds: 1500),
                                      curve: Curves.easeOutCubic,
                                      builder: (context, value, child) {
                                        return LinearProgressIndicator(
                                          value: value,
                                          backgroundColor: Colors.transparent,
                                          valueColor: AlwaysStoppedAnimation<Color>(
                                            Color.lerp(
                                              Color(0xFF6366F1),
                                              Color(0xFFEC4899),
                                              value,
                                            )!,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ).toList(),
                      )
                    ],
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