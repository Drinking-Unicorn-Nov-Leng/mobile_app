import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_app/ui/common/app_colors.dart';
import 'package:mobile_app/utils/responsive_size.dart';

class MapButton extends StatelessWidget {
  final String iconPath;
  final bool isCircle;
  final VoidCallback onTap;

  const MapButton({
    required this.iconPath,
    required this.onTap,
    this.isCircle = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44.width,
        height: 44.width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(-1, 1), // changes position of shadow
            ),
          ],
          color: Colors.white,
          borderRadius: isCircle ? null : BorderRadius.circular(12),
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        ),
        child: Center(
          child: SvgPicture.asset(
            iconPath,
            color: AppColors.darkRed,
          ),
        ),
      ),
    );
  }
}
