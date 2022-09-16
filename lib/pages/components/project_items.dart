import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/controller/project_controller.dart';
import 'package:portfolio/pages/components/project.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:portfolio/models/project_model.dart';
import 'package:get/get.dart';

import '../../utils/globals.dart';

final List<ProjectModel> projectItem = [
  ProjectModel(
      title: "하움(하루배움)",
      images: <String>[
        'assets/haum1.png',
        'assets/haum3.png',
        'assets/haum2.png',
      ],
      detail: "과거와 현재의 명언을 통해, 엄섬된 좋은 글귀들을 마음이 편안해지는 감성적인 이미지와 매일 받아볼 수 있는 어플입니다.\n명언과 글귀를 통해"
              "하루에 격려와 위로의 배움을 얻을 수 있습니다.",
      function: "글귀 저장, 글귀 보관함, 하움 알림, 위젯, 글귀 모음, 글귀 캘린더",
      techStack: "Flutter, Firebase, Swift, Java")
];
//프로젝트 상세 설명 및 이미지
class ProjectItem extends GetView<PageController>{
  @override
  Widget build(BuildContext context) {
    CarouselController carouselController = CarouselController();
    final Size screenSize = MediaQuery.of(context).size;
    final hPadding = ScreenHelper.isDesktop(context) ? screenSize.width / 7
        : ScreenHelper.isTablet(context)
        ? screenSize.width / 10
        : screenSize.width / 13;
    final List<int> carouselIndexes = Iterable<int>.generate(projectItem.length).toList();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: 70),
      child: Column(
        key: Globals.projectKey,
        children: <Widget>[
          Text('Project',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontFamily: 'Museum',
            fontSize: 35,
            color: Colors.black,
          ),),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: carouselIndexes.map((int i) {
              return IconButton(
                  icon: GetBuilder<ProjectController>(
                    builder: (controller) {
                      final int currentIndex
                      = screenSize.width >= 1100 && controller.currentIndex > 2
                          ? controller.currentIndex % 3
                          : controller.currentIndex;
                      return Icon(
                        Icons.circle,
                        color: currentIndex == i
                          ? Colors.black87
                            : Colors.black12,
                        size: 18,
                      );
                    },
                  ),
                  constraints: BoxConstraints(),
                  padding: EdgeInsets.zero,
                  onPressed: () => carouselController.animateToPage(i),);
            }).toList(),
          ),
          SizedBox(
            height: 20,
          ),
          CarouselSlider(
              items: projectItem.map((ProjectModel project) => Builder(
                builder: (BuildContext context){
                  return Project(
                    project: project,
                  );
                },
              ),
              ).toList(),
              carouselController: carouselController,
              options: CarouselOptions(
                initialPage: 1,//controller.currentIndex,
                onPageChanged: (int index, CarouselPageChangedReason reason){
                  //controller.changeCurrentIndex(index);
                },
                viewportFraction: 1,
                aspectRatio: screenSize.width < 1050
                  ? 16 / 18 * (screenSize.width / 1050)
                    : (screenSize.width < 1300 ? 16 / 10 : 16 / 8)
              ))
        ],
      ),
    );
  }
}
