import 'package:get/get.dart';

// 프로젝트 변경을 위한 Controller
class ProjectController extends GetxController {
  ProjectController({required this.currentIndex});

   int currentIndex;

  void changeCurrentIndex(int nextIndex) {
    currentIndex = nextIndex;
    update();
  }
}