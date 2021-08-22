import 'package:flutter/material.dart';
import 'package:mobile_app/domain/models/tour.dart';
import 'package:mobile_app/ui/tour/tour_page.dart';
import 'package:mobile_app/utils/responsive_size.dart';

class TourListItem extends StatelessWidget {
  final Tour tour;
  const TourListItem(this.tour);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 222.height,
      padding: EdgeInsets.symmetric(
        horizontal: 16.width,
        // vertical: 24.height,
      ),
      margin: EdgeInsets.only(
        bottom: 16.height,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            TourPage.route,
            arguments: tour,
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                tour.avatar,
                height: 140.height,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              tour.name,
              style: TextStyle(
                fontSize: 16.height,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              tour.description,
              style: TextStyle(
                fontSize: 12.height,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
