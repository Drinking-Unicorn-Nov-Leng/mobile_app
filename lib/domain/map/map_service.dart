import 'dart:typed_data';

import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_app/domain/models/place.dart';
import 'package:mobile_app/ui/map/cubit/map_cubit.dart';
import 'package:provider/provider.dart';

class MapService {
  List<Place> places = [
    Place.getBlank(),
  ];

  late GoogleMapController _controller;

  void onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  void zoomIn() {
    _controller.animateCamera(CameraUpdate.zoomIn());
  }

  void zoomOut() {
    _controller.animateCamera(CameraUpdate.zoomOut());
  }

  CameraPosition initialCameraPosition() {
    return CameraPosition(
      target: LatLng(46.20145993657801, 6.145976348541012),
      zoom: 7,
    );
  }

  Set<Marker> getMarkers(BuildContext context) {
    return places
        .map(
          (e) => Marker(
            markerId: MarkerId(e.id),
            onTap: () {
              context.read<MapCubit>().markerIsTouched(e.id);
            },
            icon: BitmapDescriptor.defaultMarker,
            position: LatLng(46.20145993657801, 6.145976348541012),
          ),
        )
        .toSet();
  }

  Future<Uint8List> _convertAssetToBytes(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }
}
