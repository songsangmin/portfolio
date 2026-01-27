import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_controller.dart' as carousel;
import 'package:flutter/material.dart';
import 'package:portfolio/pages/components/carousel_items.dart';
import 'package:portfolio/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../utils/globals.dart';

class Carousel extends StatelessWidget {
  final carousel.CarouselController carouselController = carousel.CarouselController();
  @override
  Widget build(BuildContext context) {
    double carouselContainerHeight = MediaQuery.of(context).size.height * (ScreenHelper.isMobile(context) ? .7 : .85);
   return Container(
     key: Globals.homeKey,
      height: carouselContainerHeight,
     color: Colors.white,
     width: double.infinity,
     child: Column(
       mainAxisAlignment: MainAxisAlignment.start,
       children: [
         Container(
           alignment: Alignment.center,
           child: CarouselSlider(
             carouselController: carouselController,
             options: CarouselOptions(
               //autoPlay: true,
               viewportFraction: 1,
               scrollPhysics: NeverScrollableScrollPhysics(),
               height: carouselContainerHeight,
             ),
             items: List.generate(carouselItems.length, (index) => Builder(
               builder: (BuildContext context){
                 return Container(
                   constraints: BoxConstraints(
                     minHeight: carouselContainerHeight,
                   ),
                   child: ScreenHelper(
                     desktop: _buildDesktop(context, carouselItems[index].text, carouselItems[index].image),
                     tablet: _buildTablet(context, carouselItems[index].text, carouselItems[index].image),
                     mobile: _buildMobile(context, carouselItems[index].text, carouselItems[index].image),
                   ),
                 );
               },),
             ).toList(),
           ),
         )
       ],
     ),
   );
  }
}

//큰 화면
Widget _buildDesktop(BuildContext context, Widget text, Widget image){
  return Center(
    child: ResponsiveWrapper(
      maxWidth: 1100.0,
      minWidth: 1100.0,
      defaultScale: false,
      child: Row(
        children: [
          Expanded(
            child: text,
          ),
          Expanded(
            child: image,
          )
        ],
      ),
    )
  );
}

//중간 화면
Widget _buildTablet(BuildContext context, Widget text, Widget image){
  return Center(
      child: ResponsiveWrapper(
        maxWidth: 760.0,
        minWidth: 760.0,
        defaultScale: false,
        child: Row(
          children: [
            Expanded(
              child: text,
            ),
            Expanded(
              child: image,
            )
          ],
        ),
      )
  );
}

//작은 화면
Widget _buildMobile(BuildContext context, Widget text, Widget image){
  return Container(
     constraints: BoxConstraints(
       maxWidth: MediaQuery.of(context).size.width * .8,
     ),
    width: double.infinity,
    child: text,
  );
}