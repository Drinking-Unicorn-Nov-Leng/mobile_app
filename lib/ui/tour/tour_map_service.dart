import 'dart:typed_data';

import 'dart:ui' as ui;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_app/domain/models/place.dart';
import 'package:mobile_app/ui/map/cubit/map_cubit.dart';
import 'package:provider/provider.dart';
import 'package:mobile_app/utils/responsive_size.dart';

class TourMapService with ChangeNotifier {
  List<Place> places;
  BuildContext context;
  List<PointLatLng> path = [];

  TourMapService(
    this.places,
    this.context,
  ) {
    setUpMarkers();
    setUpPath();
  }

  Future<void> setUpPath() async {
    for (int i = 0; i < places.length - 1; i++) {
      final responce = await Dio().get(
          'https://maps.googleapis.com/maps/api/directions/json?',
          queryParameters: {
            'origin':
                '${places[i].location!.latitude},${places[i].location!.longitude}',
            'destination':
                '${places[i + 1].location!.latitude},${places[i + 1].location!.longitude}',
            'key': 'AIzaSyCcQUYfTwsudhrdtcGXQFNKeUrnDDVQL2M',
          });
      if (responce.statusCode == 200) {
        final d = Directions.fromMap(responce.data);
        path.addAll(d.polylinePoints);
      }
    }

    notifyListeners();
  }

  late BitmapDescriptor souvenirsActive;
  late BitmapDescriptor museumActive;
  late BitmapDescriptor monumentActive;

  Set<Marker> markers = {};

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
      target: LatLng(58.534363, 31.261617),
      zoom: 6,
    );
  }

  Future<void> setUpMarkers() async {
    souvenirsActive = BitmapDescriptor.fromBytes(
      await _convertAssetToBytes(
          'assets/souvenirs_map_active_icon.png', 100.width.toInt()),
    );

    museumActive = BitmapDescriptor.fromBytes(
      await _convertAssetToBytes(
          'assets/museum_map_active_icon.png', 100.width.toInt()),
    );

    monumentActive = BitmapDescriptor.fromBytes(
      await _convertAssetToBytes(
          'assets/monument_map_active_icon.png', 100.width.toInt()),
    );

    markers = places
        .map(
          (e) => Marker(
            markerId: MarkerId(e.id),
            onTap: () {},
            icon: _getIconFromPlace(e),
            position: e.location!,
          ),
        )
        .toSet();
    notifyListeners();
  }

  BitmapDescriptor _getIconFromPlace(Place e) {
    if (e.category!.name == 'Сувениры') {
      return souvenirsActive;
    } else if (e.category!.name == 'Памятники') {
      return monumentActive;
    }
    return museumActive;
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

class Directions {
  final LatLngBounds bounds;
  final List<PointLatLng> polylinePoints;

  Directions({
    required this.bounds,
    required this.polylinePoints,
  });

  factory Directions.fromMap(Map<String, dynamic> data) {
    final n = data['routes'][0]['bounds']['northeast'];
    final s = data['routes'][0]['bounds']['southwest'];
    final bounds = LatLngBounds(
      southwest: LatLng(s['lat'], s['lng']),
      northeast: LatLng(n['lat'], n['lng']),
    );
    return Directions(
      bounds: bounds,
      polylinePoints: PolylinePoints()
          .decodePolyline(data['routes'][0]['overview_polyline']['points']),
    );
  }
}
