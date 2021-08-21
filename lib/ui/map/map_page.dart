import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_app/domain/map/map_service.dart';
import 'package:mobile_app/ui/map/widgets/filter_bottom,_sheet.dart';
import 'package:mobile_app/ui/map/widgets/map_button.dart';
import 'package:mobile_app/utils/config.dart';
import 'package:mobile_app/utils/responsive_size.dart';

import 'cubit/filter_cubit.dart';

class MapPage extends StatelessWidget {
  MapService mapService;

  MapPage() : mapService = getIt.get<MapService>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FilterCubit(),
      child: MapPageView(mapService),
    );
  }
}

class MapPageView extends StatelessWidget {
  MapService mapService;

  MapPageView(this.mapService);

  @override
  Widget build(BuildContext context) {
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
          onTap: () => showFilters(context),
        ),
      ),
      Positioned(
        bottom: 260.height,
        right: 16.width,
        child: MapButton(
          isCircle: true,
          iconPath: 'assets/plus_icon.svg',
          onTap: mapService.zoomIn,
        ),
      ),
      Positioned(
        right: 16.width,
        bottom: 200.height,
        child: MapButton(
          isCircle: true,
          iconPath: 'assets/minus_icon.svg',
          onTap: mapService.zoomOut,
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

    return Stack(
      children: [
        GoogleMap(
          onMapCreated: mapService.onMapCreated,
          zoomControlsEnabled: false,
          mapToolbarEnabled: false,
          markers: mapService.getMarkers(context),
          initialCameraPosition: mapService.initialCameraPosition(),
        ),
        ...buttons,
      ],
    );
  }
}
