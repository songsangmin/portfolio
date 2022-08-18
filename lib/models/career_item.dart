import 'package:flutter/material.dart';
import 'app_model.dart';

class CareerItem {
  final String company;
  final String period;
  final String position;
  final List<App> works;

  CareerItem({
    required this.company,
    required this.period,
    required this.position,
    required this.works,
  });
}