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
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "제가 사용하고 사용할 수 있는 Skill들의 숙련도 입니다.",
                        style: TextStyle(
                          fontFamily: "Jalnan",
                          color: kCaptionColor,
                          height: 1.5,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Column(
                        children: skills
                            .map(
                              (skill) => Container(
                            margin: EdgeInsets.only(bottom: 15.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: skill.percentage,
                                  child: Container(
                                    padding: EdgeInsets.only(left: 10.0),
                                    alignment: Alignment.centerLeft,
                                    height: 38.0,
                                    child: Text(skill.skill,style: TextStyle(
                                      fontFamily: "Museum",
                                      color: Colors.white
                                    ),),
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  // remaining (blank part)
                                  flex: 100 - skill.percentage,
                                  child: Divider(
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  "${skill.percentage}%",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                  ),
                                )
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