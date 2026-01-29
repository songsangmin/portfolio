import 'package:flutter/material.dart';
import 'package:portfolio/pages/components/carousel.dart';
import 'package:portfolio/pages/components/education_section.dart';
import 'package:portfolio/pages/components/footer.dart';
import 'package:portfolio/pages/components/header.dart';
import 'package:portfolio/pages/components/project_items.dart';
import 'package:portfolio/pages/components/about.dart';
import 'package:portfolio/pages/components/skill_section.dart';
import 'package:portfolio/pages/components/career.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/globals.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldKey,
      endDrawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return headerItems[index].isButton
                    ? MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Container(
                    decoration: BoxDecoration(
                      color: kDangerColor,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 28.0),
                    child: TextButton(
                      onPressed: headerItems[index].onTap,
                      child: Text(
                        headerItems[index].title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
                    : ListTile(
                  title: Text(
                    headerItems[index].title,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 10.0,
                );
              },
              itemCount: headerItems.length,
            ),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: Header(), //Header 구성, 상단 고정
            ),
            Expanded(
              child: SingleChildScrollView( // 스크롤 가능 Part
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Carousel(), // 소개글 회전,
                    SizedBox(
                      height: 75.0,
                    ),
                    About(), // 나에 관한 소개
                    SizedBox(
                      height: 120.0,
                    ),
                    SkillSection(), //Skill 숙련도
                    SizedBox(
                      height: 10.0,
                    ),
                    EducationSection(), // Stack 별 나의 수준 소개.
                    SizedBox(
                      height: 75.0,
                    ),
                    ProjectItem(), // Project 소개
                    SizedBox(
                      height: 75.0,
                    ),
                    Career(), // 이력
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 28.0),
                    //   child: PortfolioStats(),
                    // ),
                    //CvSection(), //Main Skill 소개
                    SizedBox(
                      height: 75.0,
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    // Sponsors(),
                    // SizedBox(
                    //   height: 50.0,
                    // ),
                    // TestimonialWidget(),
                    Footer(), // 하단 구성
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}