import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/models/project_model.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/constants.dart';
import '../../widgets/image_with_animated_opacity.dart';

// 프로젝트 전체
class Project extends StatelessWidget{

  Project({required this.project});

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        decoration: BoxDecoration(
          color: kSurfaceColor,
          borderRadius: BorderRadius.circular(kBorderRadius),
          boxShadow: kElevatedShadow,
                    border: Border.all(
                      color: kPrimaryColor.withValues(alpha: 0.2),
                      width: 1,
                    ),
        ),
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  gradient: kPrimaryGradient,
                  borderRadius: BorderRadius.circular(kBorderRadiusSmall),
                ),
                child: Text(
                  project.title,
                  style: TextStyle(
                    fontSize: 28.0,
                    fontFamily: "Jalnan",
                    fontWeight: FontWeight.w900,
                    color: kWhiteColor,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            SizedBox(height: 32),
            if(screenSize.width < 1050)
              Column(
                children: <Widget>[
                  ProjectImage(
                    project: project,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ProjectDetail(
                    project: project,
                  ),
                ],
              )
            else
              Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        ProjectImage(
                          project: project,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                      width: 40,
                  ),
                  Expanded(
                    child: ProjectDetail(
                      project: project,
                    ),
                  )
                ],
              )
          ],
        ),
        ),
      ),
    );
  }
}

//프로젝트 이미지 Part
class ProjectImage extends StatelessWidget {

  ProjectImage({ required this.project});

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider( // 프로젝트가 한개에서 멈추지 않을 것이기에 슬라이드쇼로 구현
        items: project.images
            .map(
                (String image) => Builder(
                  builder: (BuildContext context){
                    return AspectRatio(
                        aspectRatio: 16 / 12,
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(),
                        child: ImageWithAnimatedOpacity( // Image 변경 위젯
                          image: AssetImage(image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),).toList(),
        options: CarouselOptions( // 변경 기본 설정
          aspectRatio: 16 / 12,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 5),
          viewportFraction: 1.5,
        ));
  }
}

//프로젝트 설명 파트
class ProjectDetail extends StatelessWidget{
 ProjectDetail({required this.project});

 final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          project.detail,
          style: TextStyle(
            fontFamily: "Jalnan",
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: kTextSecondary,
            height: 1.6,
          ),
        ),
        SizedBox(height: 24),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: kBackgroundColor,
            borderRadius: BorderRadius.circular(kBorderRadiusSmall),
            border: Border.all(
              color: kPrimaryColor.withValues(alpha: 0.2),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.check_circle,
                    size: 18,
                    color: kPrimaryColor,
                  ),
                  SizedBox(width: 8),
                  Text(
                    '주요 기능:',
                    style: TextStyle(
                      fontFamily: "Jalnan",
                      fontSize: 16,
                      color: kTextPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      project.function,
                      style: TextStyle(
                        fontFamily: "Jalnan",
                        fontSize: 14,
                        color: kTextSecondary,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.code,
                    size: 18,
                    color: kSecondaryColor,
                  ),
                  SizedBox(width: 8),
                  Text(
                    '기술 스택:',
                    style: TextStyle(
                      fontFamily: "Jalnan",
                      fontSize: 16,
                      color: kTextPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      project.techStack,
                      style: TextStyle(
                        fontFamily: "Museum",
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: kSecondaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Container(
                decoration: BoxDecoration(
                  gradient: kPrimaryGradient,
                  borderRadius: BorderRadius.circular(kBorderRadiusSmall),
                  boxShadow: kCardShadow,
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () async {
                      final uri = Uri.parse("https://play.google.com/store/apps/details?id=com.ha.woom&hl=ko&gl=US");
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri, mode: LaunchMode.externalApplication);
                      }
                    },
                    borderRadius: BorderRadius.circular(kBorderRadiusSmall),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.android, color: kWhiteColor, size: 18),
                          SizedBox(width: 8),
                          Text(
                            "ANDROID",
                            style: TextStyle(
                              color: kWhiteColor,
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 16),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kBorderRadiusSmall),
                  border: Border.all(
                    color: kPrimaryColor,
                    width: 2,
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () async {
                      final uri = Uri.parse("https://apps.apple.com/kr/app/%ED%95%98%EC%9B%80/id1503624763");
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri, mode: LaunchMode.externalApplication);
                      }
                    },
                    borderRadius: BorderRadius.circular(kBorderRadiusSmall),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.phone_iphone, color: kPrimaryColor, size: 18),
                          SizedBox(width: 8),
                          Text(
                            "IOS",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}