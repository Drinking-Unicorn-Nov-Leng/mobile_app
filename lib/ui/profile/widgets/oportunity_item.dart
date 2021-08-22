import 'package:flutter/material.dart';
import 'package:mobile_app/utils/responsive_size.dart';

class OportunityItem extends StatelessWidget {
  final String backgroundImage;
  final VoidCallback onTap;

  const OportunityItem({
    required this.backgroundImage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        backgroundImage,
        fit: BoxFit.fill,
        width: 180.width,
        height: 180.width,
      ),
    );
  }
}
