import 'package:flutter/material.dart';
import 'package:mobile_app/domain/models/tour.dart';
import 'package:mobile_app/ui/tours/widgets/tour_list_item.dart';
import 'package:mobile_app/utils/responsive_size.dart';

class ToursList extends StatelessWidget {
  final List<Tour> tours;
  const ToursList(this.tours);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 24.height,
      ),
      child: Column(
        children: tours
            .map(
              (e) => TourListItem(e),
            )
            .toList(),
      ),
    );
  }
}
