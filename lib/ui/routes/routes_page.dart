import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_app/ui/routes/widgets/title_block.dart';
import 'package:mobile_app/utils/responsive_size.dart';

import 'widgets/add_route_button.dart';

class RoutesPage extends StatelessWidget {
  const RoutesPage();

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
      body: Column(
        children: [
          TitleBlock(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.width,
            ),
            child: AddRouteButton(),
          ),
        ],
      ),
    );
  }
}
