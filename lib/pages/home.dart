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
import 'package:portfolio/widgets/scroll_fade_wrapper.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _scrollContentKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldKey,
      endDrawer: Drawer(
        child: SafeArea(
          child: Material(
            color: Colors.transparent,
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: 280.0),
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
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: Header(), //Header 구성, 상단 고정
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  key: _scrollContentKey,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ScrollFadeWrapper(
                      scrollController: _scrollController,
                      scrollContentKey: _scrollContentKey,
                      child: Carousel(),
                    ),
                    SizedBox(height: 75.0),
                    About(
                      scrollController: _scrollController,
                      scrollContentKey: _scrollContentKey,
                    ),
                    SizedBox(height: 120.0),
                    // ScrollFadeWrapper 제거: 스킬 바 애니메이션이 보이도록 항상 노출
                    SkillSection(
                      scrollController: _scrollController,
                      scrollContentKey: _scrollContentKey,
                    ),
                    SizedBox(height: 75.0),
                    ScrollFadeWrapper(
                      scrollController: _scrollController,
                      scrollContentKey: _scrollContentKey,
                      child: ProjectItem(),
                    ),
                    SizedBox(height: 75.0),
                    Career(),
                    SizedBox(height: 75.0),
                    SizedBox(height: 50.0),
                    ScrollFadeWrapper(
                      scrollController: _scrollController,
                      scrollContentKey: _scrollContentKey,
                      child: Footer(),
                    ),
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