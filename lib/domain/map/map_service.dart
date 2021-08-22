import 'dart:typed_data';

import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_app/domain/models/place.dart';
import 'package:mobile_app/repository/place/place_repository.dart';
import 'package:mobile_app/ui/map/cubit/map_cubit.dart';
import 'package:provider/provider.dart';
import 'package:mobile_app/utils/responsive_size.dart';

class MapService with ChangeNotifier {
  List<Place> places = [];

  PlaceRepository placeRepository;

  bool isLoading = true;

  BuildContext context;

  MapService(this.context, this.placeRepository) {
    _fetchPlaces();
  }

  Future<void> _fetchPlaces() async {
    places = await placeRepository.getAllPlaces();
    isLoading = false;
    setUpMarkers();
  }

  late BitmapDescriptor souvenirsDisable;
  late BitmapDescriptor souvenirsActive;

  late BitmapDescriptor museumDisable;
  late BitmapDescriptor museumActive;

  late BitmapDescriptor monumentDisable;
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
      zoom: 12,
    );
  }

  Future<void> setUpMarkers() async {
    souvenirsActive = BitmapDescriptor.fromBytes(
      await _convertAssetToBytes(
          'assets/souvenirs_map_active_icon.png', 100.width.toInt()),
    );
    souvenirsDisable = BitmapDescriptor.fromBytes(
      await _convertAssetToBytes(
          'assets/souvenirs_map_disabled_icon.png', 100.width.toInt()),
    );

    museumActive = BitmapDescriptor.fromBytes(
      await _convertAssetToBytes(
          'assets/museum_map_active_icon.png', 100.width.toInt()),
    );
    museumDisable = BitmapDescriptor.fromBytes(
      await _convertAssetToBytes(
          'assets/museum_map_disabled_icon.png', 100.width.toInt()),
    );

    monumentActive = BitmapDescriptor.fromBytes(
      await _convertAssetToBytes(
          'assets/monument_map_active_icon.png', 100.width.toInt()),
    );
    monumentDisable = BitmapDescriptor.fromBytes(
      await _convertAssetToBytes(
          'assets/monument_map_disabled_icon.png', 100.width.toInt()),
    );

    markers = places
        .map(
          (e) => Marker(
            markerId: MarkerId(e.id),
            onTap: () {
              setUpMarkers();
              context.read<MapCubit>().markerIsTouched(e.id);
            },
            icon: _getIconFromPlace(e),
            position: e.location!,
          ),
        )
        .toSet();
    notifyListeners();
  }

  BitmapDescriptor _getIconFromPlace(Place e) {
    var placeId;
    try {
      placeId = context.read<MapCubit>().placeId;
    } on Exception catch (e) {
      placeId = -1;
    }
    if (e.category!.name == 'Сувениры') {
      return placeId == e.id ? souvenirsActive : souvenirsDisable;
    } else if (e.category!.name == 'Памятники') {
      return placeId == e.id ? monumentActive : monumentDisable;
    }
    return placeId == e.id ? museumActive : museumDisable;
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
