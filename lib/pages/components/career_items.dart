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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 5,
                             // vertical: 12,
                            ),
                            child: Icon(
                              Icons.circle,
                              size: 15,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              app.works[index],
                              style: TextStyle(
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