import 'package:flutter/material.dart';
import 'package:mobile_app/utils/responsive_size.dart';

class RewardsBlock extends StatelessWidget {
  const RewardsBlock({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128.height,
      width: MediaQuery.of(context).size.width,
      color: Color(0xffE6E6EB),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 8.height,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 24.width,
            ),
            child: Text(
              'Награды и значки',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12.height,
              ),
            ),
          ),
          SizedBox(
            height: 8.height,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.width),
            child: SizedBox(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 12.width),
                    child: Image.asset(
                      'assets/reward.png',
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 12.width),
                    child: Image.asset(
                      'assets/reward1.png',
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 12.width),
                    child: Image.asset(
                      'assets/reward2.png',
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 12.width),
                    child: Image.asset(
                      'assets/reward1.png',
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 12.width),
                    child: Image.asset(
                      'assets/reward2.png',
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 12.width),
                    child: Image.asset(
                      'assets/reward3.png',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
