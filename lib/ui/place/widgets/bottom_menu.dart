import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_app/ui/place/widgets/menu_button.dart';
import 'package:mobile_app/utils/responsive_size.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 63.height,
      padding: EdgeInsets.symmetric(
        horizontal: 23.width,
      ),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MenuButton(
            backgroundColor: Color(0xffF6C648),
            content: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.width,
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/routes_icon.svg',
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    'Маршрут',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {},
          ),
          MenuButton(
            backgroundColor: Colors.white,
            content: SvgPicture.asset(
              'assets/heart_icon.svg',
              color: Color(0xffF6C648),
            ),
            onTap: () {},
          ),
          MenuButton(
            backgroundColor: Colors.white,
            content: SvgPicture.asset(
              'assets/route_icon.svg',
              color: Color(0xffF6C648),
            ),
            onTap: () {},
          ),
          MenuButton(
            backgroundColor: Colors.white,
            content: SvgPicture.asset(
              'assets/play_icon.svg',
              color: Color(0xffF6C648),
            ),
            onTap: () {},
          ),
          MenuButton(
            backgroundColor: Colors.white,
            content: SvgPicture.asset(
              'assets/share_icon.svg',
              color: Color(0xffF6C648),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
