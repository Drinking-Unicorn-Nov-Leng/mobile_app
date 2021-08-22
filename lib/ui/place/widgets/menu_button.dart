import 'package:flutter/material.dart';
import 'package:mobile_app/utils/responsive_size.dart';

class MenuButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color backgroundColor;
  final Widget content;

  const MenuButton({
    required this.backgroundColor,
    required this.content,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(4.width),
        decoration: BoxDecoration(
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(-1, 2), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: content,
      ),
    );
  }
}
