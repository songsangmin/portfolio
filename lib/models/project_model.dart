class ProjectModel {
  final String title;
  final List<String> images;
  final String detail;
  final String function;
  final String techStack;
  /// 운영 종료일 (예: "2024년 10월 운영 종료"). 비어 있으면 미표시.
  final String endDate;
  /// 운영성과 설명. 비어 있으면 미표시.
  final String operatingResult;

  ProjectModel({
    required this.title,
    required this.images,
    required this.detail,
    required this.function,
    required this.techStack,
    this.endDate = '',
    this.operatingResult = '',
  });
}