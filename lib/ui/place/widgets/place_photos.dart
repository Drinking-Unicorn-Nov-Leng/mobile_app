import 'package:flutter/material.dart';
import 'package:mobile_app/domain/models/place.dart';
import 'package:mobile_app/utils/responsive_size.dart';

class PlacePhotos extends StatelessWidget {
  final Place place;

  const PlacePhotos(this.place);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.height),
      child: Container(
        height: 140.height,
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 16.width),
          itemCount: place.photoUrls.length,
          separatorBuilder: (_, __) {
            return SizedBox(
              width: 16.width,
            );
          },
          itemBuilder: (context, index) {
            return Image.network(
              place.photoUrls[index],
              width: 258.width,
              fit: BoxFit.fill,
            );
          },
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
