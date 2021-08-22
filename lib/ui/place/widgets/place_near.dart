import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_app/domain/models/place.dart';
import 'package:mobile_app/utils/responsive_size.dart';

class PlaceNear extends StatelessWidget {
  PlaceNear();

  final places = [
    Place.getBlank()
      ..name = 'Дома народного творчества'
      ..shortAdress = 'с. Мараева',
    Place.getBlank()
      ..name = 'КРАЕВЕДЧЕСКИЙ МУЗЕЙ «ЗЕМЛИ БРОННИЦКОЙ»'
      ..shortAdress = 'c. Бронница',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffE6E6EB),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.height,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.width),
            child: Text(
              'Интересные места рядом',
              style: TextStyle(
                fontSize: 10.height,
                fontWeight: FontWeight.bold,
                color: Color(0xff8A8A93),
              ),
            ),
          ),
          SizedBox(
            height: 12.height,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.width),
            child: Container(
              height: 108.height,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: places
                    .map(
                      (e) => Container(
                        width: 187.width,
                        margin: EdgeInsets.only(right: 16.width),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                              ),
                              child: Image.network(
                                e.photoUrls.first,
                                width: 66,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              width: 15.width,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 12.height,
                                ),
                                Container(
                                  width: 88.width,
                                  child: Text(
                                    e.name,
                                    style: TextStyle(
                                      fontFamily: 'Nizh',
                                      fontSize: 16.height,
                                      letterSpacing: 0.2,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/map_icon.svg',
                                      height: 20.width,
                                      width: 20.width,
                                      color: Color(0xff8A8A93),
                                    ),
                                    Text(
                                      e.shortAdress,
                                      style: TextStyle(
                                        color: Color(0xff8A8A93),
                                        fontSize: 13.height,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 16.height,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          SizedBox(
            height: 16.height,
          ),
        ],
      ),
    );
  }
}
