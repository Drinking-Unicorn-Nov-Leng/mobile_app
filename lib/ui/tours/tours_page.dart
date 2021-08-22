import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_app/domain/models/tour.dart';
import 'package:mobile_app/ui/tours/widgets/title_block.dart';
import 'package:mobile_app/ui/tours/widgets/tours_list.dart';
import 'package:mobile_app/utils/responsive_size.dart';

import 'widgets/add_tour_button.dart';

class ToursPage extends StatelessWidget {
  ToursPage();

  final tours = [
    Tour.getBlank(),
    Tour.getBlank(),
    Tour.getBlank(),
    Tour.getBlank(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Маршруты',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.6.width),
            child: SvgPicture.asset(
              'assets/search_icon.svg',
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TitleBlock(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.width,
              ),
              child: AddTourButton(),
            ),
            ToursList(tours),
          ],
        ),
      ),
    );
  }
}
