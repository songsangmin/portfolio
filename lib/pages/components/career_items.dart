import 'package:flutter/material.dart';
import '../../models/app_model.dart';
import '../../utils/constants.dart';

class CareerSection extends StatelessWidget {
  CareerSection({Key? key, required this.app}) : super(key: key);

  final App app;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (app.name.isNotEmpty) ...[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              gradient: kPrimaryGradient,
              borderRadius: BorderRadius.circular(kBorderRadiusSmall),
            ),
            child: Text(
              app.name,
              style: TextStyle(
                fontSize: 16,
                fontFamily: "Jalnan",
                fontWeight: FontWeight.bold,
                color: kWhiteColor,
              ),
            ),
          ),
          if (app.detail.isNotEmpty) ...[
            SizedBox(height: 4),
            Text(
              app.detail,
              style: TextStyle(
                fontSize: 12,
                fontFamily: "Museum",
                color: kCaptionColor,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
          SizedBox(height: 12),
        ],
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List<Widget>.generate(
            app.works.length,
            (int index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 6, right: 12),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: kPrimaryGradient,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        app.works[index],
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Jalnan",
                          fontWeight: FontWeight.w500,
                          color: kTextSecondary,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}