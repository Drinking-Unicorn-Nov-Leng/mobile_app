import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_app/ui/common/app_colors.dart';
import 'package:mobile_app/utils/responsive_size.dart';

class FlyingBavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function onTap;

  FlyingBavigationBar(
    this.currentIndex,
    this.onTap,
  );

  final titles = [
    "Маршруты",
    "Карта",
    "Профиль",
  ];
  final iconPaths = [
    "assets/routes_icon.svg",
    "assets/map_icon.svg",
    "assets/profile_icon.svg"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.height),
      child: Container(
        width: 274.width,
        height: 56.height,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(-1, 1), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 6.height,
            horizontal: 20.width,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              3,
              (index) => GestureDetector(
                onTap: () => onTap(index),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      iconPaths[index],
                      color: index == currentIndex
                          ? AppColors.darkRed
                          : Color(0xffC4C4CC),
                    ),
                    Spacer(),
                    Text(
                      titles[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: index == currentIndex
                            ? AppColors.darkRed
                            : Color(0xffC4C4CC),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
