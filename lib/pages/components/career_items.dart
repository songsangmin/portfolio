import 'package:flutter/material.dart';
import '../../models/app_model.dart';

class CareerSection extends StatelessWidget {
  CareerSection({Key? key, required this.app}) : super(key: key);

  final App app;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 15.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 앱 이름·디테일이 있을 때만 표시 (career 섹션 기존 색/폰트와 동일)
          if (app.name.isNotEmpty || app.detail.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  if (app.name.isNotEmpty)
                    Text(
                      app.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: "Jalnan",
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  if (app.name.isNotEmpty && app.detail.isNotEmpty)
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        '·',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  if (app.detail.isNotEmpty)
                    Text(
                      app.detail,
                      style: const TextStyle(
                        fontSize: 17,
                        fontFamily: "Jalnan",
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                ],
              ),
            ),
          ],
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 5.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List<Widget>.generate(
                app.works.length,
                (int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            child: Icon(
                              Icons.circle,
                              size: 15,
                              color: Colors.black87,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              app.works[index],
                              style: const TextStyle(
                                fontSize: 20,
                                fontFamily: "Jalnan",
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}