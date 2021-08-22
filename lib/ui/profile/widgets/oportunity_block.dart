import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mobile_app/ui/profile/widgets/oportunity_item.dart';
import 'package:mobile_app/utils/responsive_size.dart';

class OportunityBlock extends StatelessWidget {
  const OportunityBlock();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 24.height,
      ),
      child: Wrap(
        spacing: 16.width,
        runSpacing: 16.height,
        children: [
          OportunityItem(
            backgroundImage: 'assets/add_place.png',
            onTap: () {},
          ),
          OportunityItem(
            backgroundImage: 'assets/alisa_on.png',
            onTap: () {},
          ),
          OportunityItem(
            backgroundImage: 'assets/favorits.png',
            onTap: () {},
          ),
          OportunityItem(
            backgroundImage: 'assets/audiogid.png',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
