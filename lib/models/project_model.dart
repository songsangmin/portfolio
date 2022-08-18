import 'package:flutter/material.dart';

class ProjectModel {
  final String title;
  final List<String> images;
  final String detail;
  final String function;
  final String techStack;

  ProjectModel({
    required this.title,
    required this.images,
    required this.detail,
    required this.function,
    required this.techStack,
  });
}