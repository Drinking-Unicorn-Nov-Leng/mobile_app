import 'package:flutter/material.dart';
import 'package:mobile_app/utils/responsive_size.dart';

class PlaceTags extends StatelessWidget {
  PlaceTags();

  final tags = [
    'Для всей семьи',
    'Активный отдых',
    'Недалеко',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.width),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 12.height,
              ),
              Text(
                'Тематические теги',
                style: TextStyle(
                  fontSize: 10.height,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff8A8A93),
                ),
              ),
              Container(
                height: 52.height,
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  scrollDirection: Axis.horizontal,
                  children: tags
                      .map(
                        (e) => Container(
                          margin: EdgeInsets.only(right: 12.width),
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.width,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset:
                                    Offset(-1, 1), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(e),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              SizedBox(
                height: 12.height,
              ),
            ],
          ),
        ),
        Container(
          height: 1,
          color: Color(0xffE6E6EB),
        ),
      ],
    );
  }
}
