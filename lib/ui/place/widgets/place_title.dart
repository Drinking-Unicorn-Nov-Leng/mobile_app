import 'package:flutter/material.dart';
import 'package:mobile_app/domain/models/place.dart';
import 'package:mobile_app/ui/map/cubit/map_cubit.dart';
import 'package:mobile_app/utils/responsive_size.dart';
import 'package:provider/provider.dart';

class PlaceTitle extends StatelessWidget {
  final Place place;

  const PlaceTitle(this.place);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 12.height,
        ),
        Center(
          child: Container(
            height: 4.height,
            width: 20.width,
            decoration: BoxDecoration(
              color: Color(0xffDDDDE0),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        SizedBox(
          height: 10.height,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 23.width,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                place.category.name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.height,
                ),
              ),
              SizedBox(
                width: 8.height,
              ),
              Container(
                height: 15.height,
                color: Colors.black,
                width: 1,
              ),
              SizedBox(
                width: 8.height,
              ),
              Text(
                place.city,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.height,
                  decoration: TextDecoration.underline,
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () => context.read<MapCubit>().markerIsUntouched(),
                child: Container(
                  height: 22.width,
                  width: 22.width,
                  decoration: BoxDecoration(
                    color: Color(0xffA1A0A3),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 16.height,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.height,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 14.width,
          ),
          child: Text(
            place.name,
            style: TextStyle(
              fontFamily: 'Nizh',
              fontSize: 23.height,
            ),
          ),
        ),
        SizedBox(
          height: 4.height,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 14.width,
          ),
          child: Text(
            place.shortDescription,
            style: TextStyle(
              fontSize: 12.height,
            ),
          ),
        ),
        SizedBox(
          height: 6.height,
        ),
      ],
    );
  }
}
