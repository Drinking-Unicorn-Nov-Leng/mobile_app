import 'package:flutter/material.dart';
import 'package:mobile_app/domain/models/place.dart';
import 'package:mobile_app/utils/responsive_size.dart';

class PlaceSecription extends StatelessWidget {
  final Place place;
  const PlaceSecription(this.place);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 12.height,
        ),
        Padding(
          padding: EdgeInsets.only(left: 16.width),
          child: Text(
            'Описание',
            style: TextStyle(
              fontSize: 10.height,
              fontWeight: FontWeight.bold,
              color: Color(0xff8A8A93),
            ),
          ),
        ),
        SizedBox(
          height: 8.height,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 16.width,
            right: 16.width,
            bottom: 24.height,
          ),
          child: Text(
            place.description,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12.height,
            ),
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
