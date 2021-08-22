import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_app/domain/models/tour.dart';
import 'package:mobile_app/ui/map/widgets/map_button.dart';
import 'package:mobile_app/ui/tour/tour_map_service.dart';
import 'package:provider/provider.dart';
import 'package:mobile_app/utils/responsive_size.dart';

class TourPage extends StatelessWidget {
  static const route = '/tour';
  final Tour tour;

  const TourPage(this.tour);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          tour.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.black,
          ),
        ),
      ),
      body: ChangeNotifierProvider(
        create: (context) => TourMapService(tour.places, context),
        builder: (_, __) => TourPageView(),
      ),
    );
  }
}

class TourPageView extends StatelessWidget {
  const TourPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mapService = context.watch<TourMapService>();

    final buttons = [
      Positioned(
        top: 32.height,
        right: 16.width,
        child: MapButton(
          isCircle: true,
          iconPath: 'assets/plus_icon.svg',
          onTap: mapService.zoomIn,
        ),
      ),
      Positioned(
        right: 16.width,
        top: 92.height,
        child: MapButton(
          isCircle: true,
          iconPath: 'assets/minus_icon.svg',
          onTap: mapService.zoomOut,
        ),
      ),
      Positioned(
        right: 16.width,
        top: 164.height,
        child: MapButton(
          isCircle: true,
          iconPath: 'assets/location_icon.svg',
          onTap: () {},
        ),
      ),
    ];
    return Stack(
      children: [
        GoogleMap(
          onMapCreated: mapService.onMapCreated,
          zoomControlsEnabled: false,
          mapToolbarEnabled: false,
          onTap: (q) {
            // context.read<MapCubit>().markerIsUntouched();
          },
          markers: mapService.markers,
          initialCameraPosition: mapService.initialCameraPosition(),
        ),
        ...buttons,
      ],
    );
  }
}
