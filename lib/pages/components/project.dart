import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/models/project_model.dart';
import 'package:portfolio/utils/globals.dart';
import 'package:portfolio/widgets/horizontal_divide.dart';
import '../../utils/constants.dart';
import '../../widgets/image_with_animated_opacity.dart';

class Project extends StatelessWidget{

  Project({required this.project});

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 40.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              project.title,
              style: TextStyle(
                fontSize: 30.0,
                fontFamily: "Jalnan",
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 30,
            ),
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
      )
    );
  }
}

class ProjectImage extends StatelessWidget {

  ProjectImage({ required this.project});

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: project.images
            .map(
                (String image) => Builder(
                  builder: (BuildContext context){
                    return AspectRatio(
                        aspectRatio: 16 / 12,
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(),
                        child: ImageWithAnimatedOpacity(
                          image: AssetImage(image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),).toList(),
        options: CarouselOptions(
          aspectRatio: 16 / 12,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 5),
          viewportFraction: 1.5,
        ));
  }
}

class ProjectDetail extends StatelessWidget{
 ProjectDetail({required this.project});

 final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(project.detail, style: TextStyle(
          fontFamily: "Jalnan",
          fontSize: 22,
          fontWeight: FontWeight.w400
        ),),
        HorizontalDivide(space: 30,color: Colors.black54,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5,
              //vertical: 12,
            ),
            child: Icon(
              Icons.circle,
              size: 15,
            ),
          ),
          Text('주요 기능:',style: TextStyle(
            fontFamily: "Jalnan",
            fontSize: 17.5,
          ),),
          SizedBox(width: 10,),
          Expanded(
              child: Text(project.function, style: TextStyle(
                fontFamily: "Jalnan",
                fontSize: 17.5,
              ),)),
        ],),
        SizedBox(height: 10,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 5,
                  //vertical: 12,
                ),
            child: Icon(
              Icons.circle,
              size: 15,
            ),),
            Text('기술 스택:', style: TextStyle(
              fontFamily: "Jalnan",
              fontSize: 17.5,
            ),),
            SizedBox(width: 10,),
            Expanded(
              child: Text(project.techStack, style: TextStyle(
                fontFamily: "Museum",
                fontWeight: FontWeight.bold,
                fontSize: 17.5,
              ),),
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
        Row(
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                height: 48.0,
                padding: EdgeInsets.symmetric(
                  horizontal: 28.0,
                ),
                child: TextButton(
                  onPressed: () {

                  },
                  child: Center(
                    child: Text(
                      "ANDROID APP",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 20,),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                height: 48.0,
                padding: EdgeInsets.symmetric(horizontal: 28.0),
                child: TextButton(
                  onPressed: () {

                  },
                  child: Center(
                    child: Text(
                      "IOS APP",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
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