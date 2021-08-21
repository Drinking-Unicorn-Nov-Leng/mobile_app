import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_app/ui/map/widgets/map_button.dart';
import 'package:mobile_app/utils/responsive_size.dart';

class MapPage extends StatelessWidget {
  MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          zoomControlsEnabled: false,
          initialCameraPosition: CameraPosition(
            target: LatLng(46.20145993657801, 6.145976348541012),
            zoom: 7,
          ),
        ),
        ...buttons,
      ],
    );
  }

  final buttons = [
    Positioned(
      left: 16.width,
      top: 12.height,
      child: MapButton(
        iconPath: 'assets/menu_icon.svg',
        onTap: () {},
      ),
    ),
    Positioned(
      top: 12.height,
      right: 16.width,
      child: MapButton(
        iconPath: 'assets/filter_icon.svg',
        onTap: () {},
      ),
    ),
    Positioned(
      bottom: 260.height,
      right: 16.width,
      child: MapButton(
        isCircle: true,
        iconPath: 'assets/plus_icon.svg',
        onTap: () {},
      ),
    ),
    Positioned(
      right: 16.width,
      bottom: 200.height,
      child: MapButton(
        isCircle: true,
        iconPath: 'assets/minus_icon.svg',
        onTap: () {},
      ),
    ),
    Positioned(
      right: 16.width,
      bottom: 104.height,
      child: MapButton(
        isCircle: true,
        iconPath: 'assets/location_icon.svg',
        onTap: () {},
      ),
    ),
  ];
}
