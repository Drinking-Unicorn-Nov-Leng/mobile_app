import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_app/domain/models/category.dart';
import 'package:mobile_app/utils/responsive_size.dart';

class Categoryitem extends StatefulWidget {
  final Category category;
  final Function(bool) onChanged;

  const Categoryitem(
    this.category,
    this.onChanged,
  );

  @override
  _CategoryitemState createState() => _CategoryitemState();
}

class _CategoryitemState extends State<Categoryitem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 16.width,
        top: 16.height,
        bottom: 12.height,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 11.width,
          ),
          SvgPicture.asset(
            widget.category.iconPath,
          ),
          SizedBox(
            width: 10.width,
          ),
          Text(
            widget.category.name,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Spacer(),
          CupertinoSwitch(
              activeColor: Color(0xffF6C648),
              value: widget.category.isActive,
              onChanged: (val) {
                widget.onChanged(val);
                setState(() {
                  widget.category.isActive = val;
                });
                ;
              }),
        ],
      ),
    );
  }
}
