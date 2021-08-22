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
        builder: (_, __) => TourPageView(tour),
      ),
    );
  }
}

class TourPageView extends StatelessWidget {
  final Tour tour;
  const TourPageView(this.tour);

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
          polylines: {
            Polyline(
              polylineId: PolylineId('123'),
              color: Color(0xff4CF184),
              width: 10,
              points: mapService.path
                  .map((e) => LatLng(e.latitude, e.longitude))
                  .toList(),
            ),
          },
          markers: mapService.markers,
          initialCameraPosition: mapService.initialCameraPosition(),
        ),
        ...buttons,
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: BottomSheet(
            backgroundColor: Colors.transparent,
            onClosing: () {},
            builder: (contxet) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 12.height,
                    ),
                    Container(
                      height: 4.height,
                      width: 20.width,
                      decoration: BoxDecoration(
                        color: Color(0xffDDDDE0),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    SizedBox(
                      height: 12.height,
                    ),
                    Text(
                      tour.name,
                      style: TextStyle(
                        fontFamily: 'Nizh',
                        fontSize: 32.height,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 16.height,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 42.width,
                      ),
                      child: Text(
                        tour.description,
                        style: TextStyle(
                          fontSize: 14.height,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 16.height,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
