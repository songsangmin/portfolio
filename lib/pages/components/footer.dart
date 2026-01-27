import 'package:flutter/material.dart';
import 'package:portfolio/models/footer_item.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/screen_helper.dart';
import 'package:url_launcher/url_launcher.dart';

final List<FooterItem> footerItems = [
  FooterItem(
    iconPath: "assets/github2.png",
    title: "GitHub",
    text1: "https://www.github.com/songsangmin",
    text2: "",
  ),
  FooterItem(
    iconPath: "assets/blog.png",
    title: "Blog",
    text1: "https://velog.io/@songoori",
    text2: "",
  ),
];

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth, context),
        tablet: _buildUi(kTabletMaxWidth, context),
        mobile: _buildUi(getMobileMaxWidth(context), context),
      ),
    );
  }
}

Widget _buildUi(double width, BuildContext context) {
  return Center(
    child: ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: width,
        minWidth: width,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 50.0),
                child: Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: footerItems
                      .map(
                        (footerItem) => Container(
                      height: 120.0,
                      width: ScreenHelper.isMobile(context)
                          ? constraints.maxWidth / 2.0 - 20.0
                          : constraints.maxWidth / 4.0 - 20.0,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  footerItem.iconPath,
                                  width: 30.0,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Text(
                                  footerItem.title,
                                  style: TextStyle(
                                    fontFamily: "Jalnan",
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15.0,
                            ),Row(
                              children: [ //Todo 나중에 디자인 이쁘게 바꿔보기
                                Text("Check ", style: TextStyle(
                                 fontSize: 15,
                                 fontFamily: "Museum",
                                 fontWeight: FontWeight.w300,
                                 color: Colors.black,
                                ),),
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () async {
                                      final uri = Uri.parse(footerItem.text1);
                                      if (await canLaunchUrl(uri)) {
                                        await launchUrl(uri, mode: LaunchMode.externalApplication);
                                      }
                                    },
                                    child: Text(
                                      "${footerItem.title}️",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Museum",
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(" ✔", style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: "Museum",
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black,
                                ),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                      .toList(),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Flex(
                direction: ScreenHelper.isMobile(context)
                    ? Axis.vertical
                    : Axis.horizontal,
                mainAxisAlignment: ScreenHelper.isMobile(context)
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Copyright (c) 2022 SongSangMin. All rights Reserved",
                      style: TextStyle(
                        color: kCaptionColor,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Text(
                            "Privacy Policy",
                            style: TextStyle(
                              color: kCaptionColor,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "|",
                          style: TextStyle(
                            color: kCaptionColor,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Text(
                            "Terms & Conditions",
                            style: TextStyle(
                              color: kCaptionColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          );
        },
      ),
    ),
  );
}