import 'package:flutter/material.dart';
import 'package:mobile_app/utils/responsive_size.dart';

class TitleBlock extends StatelessWidget {
  const TitleBlock();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 24.height,
        ),
        Text(
          'Путеводитель по области'.toUpperCase(),
          style: TextStyle(
            fontFamily: 'Nizh',
            fontSize: 32.height,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 50.width,
            vertical: 16.height,
          ),
          child: Text(
            'Интересные места, легенды, былины, народная кухня - показываем маршруты в мир сказок',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.height,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
