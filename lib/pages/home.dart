import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio/pages/components/carousel.dart';
import 'package:portfolio/pages/components/cv_section.dart';
import 'package:portfolio/pages/components/education_section.dart';
import 'package:portfolio/pages/components/footer.dart';
import 'package:portfolio/pages/components/header.dart';
import 'package:portfolio/pages/components/project_items.dart';
import 'package:portfolio/pages/components/about.dart';
import 'package:portfolio/pages/components/skill_section.dart';
import 'package:portfolio/pages/components/sponsors.dart';
import 'package:portfolio/pages/components/testimonial_widget.dart';
import 'package:portfolio/pages/components/career.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/globals.dart';

import 'components/project.dart';

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
              child: Header(), //Header 구성
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Carousel(), //소개글 구성
                    SizedBox(
                      height: 75.0,
                    ),
                    About(),
                    SizedBox(
                      height: 120.0,
                    ),
                    SkillSection(), //Skill 숙련도
                    SizedBox(
                      height: 10.0,
                    ),
                    EducationSection(),
                    SizedBox(
                      height: 75.0,
                    ),
                    ProjectItem(),
                    SizedBox(
                      height: 75.0,
                    ),
                    Career(),
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
                    Footer(),
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