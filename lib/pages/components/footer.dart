import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
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
                        (footerItem) => MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () async {
                              final uri = Uri.parse(footerItem.text1);
                              if (await canLaunchUrl(uri)) {
                                await launchUrl(uri, mode: LaunchMode.externalApplication);
                              }
                            },
                            child: Container(
                              height: 140.0,
                              width: ScreenHelper.isMobile(context)
                                  ? constraints.maxWidth / 2.0 - 10.0
                                  : constraints.maxWidth / 4.0 - 15.0,
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: kSurfaceColor,
                                borderRadius: BorderRadius.circular(kBorderRadius),
                                boxShadow: kCardShadow,
                                border: Border.all(
                                  color: kPrimaryColor.withValues(alpha: 0.2),
                                  width: 1,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      gradient: kPrimaryGradient,
                                      borderRadius: BorderRadius.circular(kBorderRadiusSmall),
                                    ),
                                    child: Image.asset(
                                      footerItem.iconPath,
                                      width: 32.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    footerItem.title,
                                    style: TextStyle(
                                      fontFamily: "Jalnan",
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w700,
                                      color: kTextPrimary,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Text(
                                        "Visit ",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Museum",
                                          fontWeight: FontWeight.w400,
                                          color: kTextSecondary,
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_forward,
                                        size: 16,
                                        color: kPrimaryColor,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
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
                      "Copyright (c) 2025 SongSangMin. All rights Reserved",
                      style: TextStyle(
                        color: kCaptionColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Privacy Policy",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 14,
                              decoration: TextDecoration.underline,
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
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Terms & Conditions",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 14,
                              decoration: TextDecoration.underline,
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