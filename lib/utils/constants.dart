import 'package:flutter/material.dart';

const Color kPrimaryColor = Color.fromRGBO(11, 141, 184, 1);
const Color kBackgroundColor = Color.fromRGBO(0, 0, 0, 1);
const Color kWhiteColor = Color.fromRGBO(255, 255, 255, 1);
const Color kDangerColor = Color.fromRGBO(249, 77, 30, 1);
const Color kCaptionColor = Color.fromRGBO(100, 100, 100, 1);

const double kDesktopMaxWidth = 1100.0;
const double kTabletMaxWidth = 760.0;
double getMobileMaxWidth(BuildContext context) =>
    MediaQuery.of(context).size.width * .8;