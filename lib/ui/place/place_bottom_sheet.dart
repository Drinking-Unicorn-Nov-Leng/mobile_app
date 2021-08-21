import 'package:flutter/material.dart';
import 'package:mobile_app/domain/models/place.dart';
import 'package:mobile_app/ui/place/widgets/bottom_menu.dart';
import 'package:mobile_app/ui/place/widgets/place_info.dart';
import 'package:mobile_app/ui/place/widgets/place_mode_of_work.dart';
import 'package:mobile_app/ui/place/widgets/place_title.dart';

import 'widgets/place_photos.dart';

class PlaceBottomSheet extends StatelessWidget {
  final place = Place.getBlank();
  PlaceBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DraggableScrollableSheet(
        initialChildSize: 0.4,
        minChildSize: 0.4,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Stack(
              children: [
                ListView(
                  shrinkWrap: true,
                  controller: scrollController,
                  children: [
                    PlaceTitle(place),
                    ModeOfWork(place),
                    PlacePhotos(place),
                    PlaceInfo(place),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: BottomMenu(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
