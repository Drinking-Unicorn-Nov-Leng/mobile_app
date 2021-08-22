import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_app/domain/models/place.dart';
import 'package:mobile_app/utils/responsive_size.dart';

class PlaceInfo extends StatelessWidget {
  final Place place;
  const PlaceInfo(this.place);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 1,
          color: Color(0xffE6E6EB),
        ),
        PlaceInfoTitle(
          data: place.adress,
          iconPath: 'assets/place_icon.svg',
        ),
        PlaceInfoTitle(
          data: place.phone,
          iconPath: 'assets/phone_icon.svg',
        ),
        PlaceInfoTitle(
          data: place.site,
          iconPath: 'assets/web_icon.svg',
        ),
        PlaceInfoTitle(
          data: "${place.location.latitude} ,${place.location.longitude}",
          iconPath: 'assets/geo_icon.svg',
        ),
        Container(
          height: 1,
          color: Color(0xffE6E6EB),
        ),
      ],
    );
  }
}

class PlaceInfoTitle extends StatelessWidget {
  final String iconPath;
  final String data;

  const PlaceInfoTitle({
    required this.data,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10.height,
        ),
        Row(
          children: [
            SizedBox(
              width: 16.width,
            ),
            SvgPicture.asset(iconPath),
            SizedBox(
              width: 8.width,
            ),
            Container(
              width: 330.width,
              child: Text(
                data,
                style: TextStyle(),
              ),
            ),
            SizedBox(
              width: 16.width,
            ),
          ],
        ),
        SizedBox(
          height: 10.height,
        ),
        Container(
          height: 1,
          color: Color(0xffE6E6EB),
        ),
      ],
    );
  }
}
