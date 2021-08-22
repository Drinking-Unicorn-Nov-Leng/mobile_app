import 'package:flutter/material.dart';
import 'package:mobile_app/utils/responsive_size.dart';

class TitleBlock extends StatelessWidget {
  const TitleBlock({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 12.height,
        bottom: 16.height,
        right: 19.width,
        left: 24.width,
      ),
      height: 100,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 10.height,
              bottom: 14.height,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Андрей Плетнев',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.height,
                  ),
                ),
                Spacer(),
                Text(
                  'Пол: мужской',
                  style: TextStyle(
                    fontSize: 12.height,
                    color: Color(0xffB1AFB8),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            width: 72.width,
            height: 72.width,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(
                    'https://avatars.mds.yandex.net/get-kinopoisk-image/1777765/933167f5-f078-44b6-81f1-157c9c685ff8/280x420',
                  ),
                  fit: BoxFit.fill),
            ),
          ),
        ],
      ),
    );
  }
}
