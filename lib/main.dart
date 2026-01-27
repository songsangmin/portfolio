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
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kWhiteColor,
        primaryColor: kPrimaryColor,
        canvasColor: kWhiteColor,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      builder: (context, widget) => ResponsiveBreakpoints.builder(
        child: widget!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1000, name: TABLET),
          const Breakpoint(start: 1001, end: 1200, name: DESKTOP),
          const Breakpoint(start: 1201, end: 2460, name: DESKTOP),
          const Breakpoint(start: 2461, end: double.infinity, name: "4K"),
        ],
      ),
      home: Home(),
      initialBinding: BindingsBuilder(
          (){
            Get.put(ProjectController(currentIndex: 0)); // Get 초기 설정
          }
      ),
    );
  }
}