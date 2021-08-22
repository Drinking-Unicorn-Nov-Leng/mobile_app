import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/utils/responsive_size.dart';

class AddRouteButton extends StatelessWidget {
  const AddRouteButton();

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: Color(0xffc4c4c4),
      strokeWidth: 1,
      dashPattern: [
        10,
      ],
      radius: Radius.circular(16),
      child: Container(
        height: 34.height,
        decoration: BoxDecoration(),
      ),
    );
  }
}
