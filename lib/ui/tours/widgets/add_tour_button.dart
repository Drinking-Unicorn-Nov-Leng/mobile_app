import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/utils/responsive_size.dart';

class AddTourButton extends StatelessWidget {
  const AddTourButton();

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: Color(0xffc4c4c4),
      strokeWidth: 1,
      borderType: BorderType.RRect,
      dashPattern: [
        10,
      ],
      radius: Radius.circular(16),
      child: Container(
        height: 34.height,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                color: Color(0xffc4c4c4),
              ),
              SizedBox(
                width: 12.width,
              ),
              Text(
                'Добавить свой маршрут',
                style: TextStyle(
                  color: Color(0xffc4c4c4),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
