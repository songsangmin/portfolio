import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/pages/home.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'controller/project_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '송상민 PortFolio',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: Theme.of(context).copyWith(
      scaffoldBackgroundColor: kWhiteColor,
      primaryColor: kPrimaryColor,
      canvasColor: kWhiteColor,
      textTheme: GoogleFonts.latoTextTheme(),
      ),
      builder: (context, widget) => ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, widget!),
          defaultScale: true,
          breakpoints: [// 반응 한계치 설정
            ResponsiveBreakpoint.resize(450, name: MOBILE),
            ResponsiveBreakpoint.resize(800, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: TABLET),
            ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            ResponsiveBreakpoint.resize(2460, name: "4K"),
          ],
        background: Container(
          color: kBackgroundColor,
      ),
        ) ,
      home: Home(),
      initialBinding: BindingsBuilder(
          (){
            Get.put(ProjectController(currentIndex: 0)); // Get 초기 설정
          }
      ),
    );
  }
}