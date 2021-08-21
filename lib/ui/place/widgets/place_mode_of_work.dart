import 'package:flutter/material.dart';
import 'package:mobile_app/domain/models/place.dart';
import 'package:mobile_app/utils/responsive_size.dart';

class ModeOfWork extends StatelessWidget {
  Place place;

  ModeOfWork(this.place);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Color(0xffE6E6EB),
          height: 1,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 7.height),
          child: Row(
            children: [
              SizedBox(
                width: 16.width,
              ),
              Text(
                'Открыто',
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
              SizedBox(
                width: 8.width,
              ),
              Container(
                color: Color(0xffE6E6EB),
                height: 13.height,
                width: 1,
              ),
              SizedBox(
                width: 8.width,
              ),
              Text(
                'Закроется в 10:00 (пн)',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        Container(
          color: Color(0xffE6E6EB),
          height: 1,
        ),
      ],
    );
  }
}
