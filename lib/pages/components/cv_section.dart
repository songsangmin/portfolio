import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/models/design_process.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'dart:html' as html;

final List<DesignProcess> designProcesses = [
  DesignProcess(
      title: "Flutter",
      imagePath: "assets/flutter.png",
      subTitle: "https://flutter-ko.dev/"
  ),
  DesignProcess(
      title: "FIREBASE",
      imagePath: "assets/firebase.png",
      subTitle: "https://firebase.google.com/?hl=ko"
  ),
  DesignProcess(
      title: "GITHUB",
      imagePath: "assets/github.png",
      subTitle: "https://github.com/"
  ),
  DesignProcess(
      title: "MARIADB",
      imagePath: "assets/mariadb.png",
      subTitle: "https://mariadb.com/ko/"
  ),
];

class CvSection extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ScreenHelper(
        desktop: _buildUi(context, 1000.0),
        tablet: _buildUi(context, 760.0),
        mobile: _buildUi(context, MediaQuery.of(context).size.width * .8),

      ),
    );
  }

  Widget _buildUi(BuildContext context, double width){
    return ResponsiveWrapper(
        maxWidth: width,
        minWidth: width,
        defaultScale: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Main Skills",
                  style: TextStyle(
                    fontFamily: "Museum",
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    height: 1.8,
                    fontSize: 18.0,
                  ),
                ),
                // GestureDetector(
                //   onTap: (){},
                //   child: MouseRegion(
                //     cursor: SystemMouseCursors.click,
                //     child: Text(
                //       "Download File",
                //       style: GoogleFonts.oswald(
                //         color: kPrimaryColor,
                //         fontWeight: FontWeight.w900,
                //         fontSize: 16.0,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Container(
                child:  LayoutBuilder(
                  builder: (_context, constraints){
                    return ResponsiveGridView.builder(
                        padding: EdgeInsets.all(0.0),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        alignment: Alignment.topCenter,
                        gridDelegate: ResponsiveGridDelegate(
                          mainAxisSpacing: 20.0,
                          crossAxisSpacing: 20.0,
                          maxCrossAxisExtent: ScreenHelper.isTablet(context) || ScreenHelper.isMobile(context) ? constraints.maxWidth / 2.0 : 250.0,
                          childAspectRatio: ScreenHelper.isDesktop(context) ? 1 : MediaQuery.of(context).size.aspectRatio * 1.5,
                        ),
                        itemBuilder: (BuildContext context, int index){
                          return Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      designProcesses[index].imagePath,
                                      width: 40.0,
                                    ),
                                    SizedBox(
                                      width: 15.0,
                                    ),
                                    Text(
                                      designProcesses[index].title,
                                      style: TextStyle(
                                        fontFamily: "Museum",
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 30.0,
                                ),
                                GestureDetector(
                                  onTap: () async{
                                    html.window.open(designProcesses[index].subTitle,"_blank");
                                  },
                                  child: MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: Text(
                                      "Go " + designProcesses[index].title + " Main Site ->",
                                      textAlign: TextAlign.end,
                                      style: GoogleFonts.oswald(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                ),
                                // RichText(
                                //   text: TextSpan(children: [
                                //   TextSpan(text: designProcesses[index].subTitle,
                                //     style: TextStyle(
                                //     fontFamily: "Jalnan",
                                //     color: kCaptionColor,
                                //     height: 1.5,
                                //     fontSize: 15.0,
                                //   ),recognizer: TapGestureRecognizer()..onTapDown = (details){
                                //           launchUrl(Uri.parse(designProcesses[index].subTitle));
                                //     },)
                                //   ])
                                // )
                              ],
                            ),
                          );
                        },
                        itemCount: designProcesses.length,);
                  },
                ),
            )
          ],
        ));
  }
}