import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_app/domain/models/filter.dart';
import 'package:mobile_app/ui/map/cubit/filter_cubit.dart';
import 'package:mobile_app/utils/responsive_size.dart';
import 'package:provider/provider.dart';

class Filteritem extends StatefulWidget {
  final Filter filter;
  final Function(bool) onChanged;

  const Filteritem(
    this.filter,
    this.onChanged,
  );

  @override
  _FilteritemState createState() => _FilteritemState();
}

class _FilteritemState extends State<Filteritem> {
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
            widget.filter.iconPath,
          ),
          SizedBox(
            width: 10.width,
          ),
          Text(
            widget.filter.name,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Spacer(),
          CupertinoSwitch(
              activeColor: Color(0xffF6C648),
              value: widget.filter.isActive,
              onChanged: (val) {
                widget.onChanged(val);
                setState(() {
                  widget.filter.isActive = val;
                });
                ;
              }),
        ],
      ),
    );
  }
}
