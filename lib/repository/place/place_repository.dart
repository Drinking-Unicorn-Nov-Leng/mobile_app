import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mobile_app/domain/models/place.dart';
import 'package:mobile_app/repository/common/client_provider.dart';
import 'package:mobile_app/repository/common/parser.dart';
import 'package:mobile_app/repository/place/plase_parser.dart';

class PlaceRepository {
  Dio client = ClientProvider.getClient();
  PlaceParser parser = PlaceParser();

  PlaceRepository();

  Future<List<Place>> getAllPlaces() async {
    final response = await client.get(':4050/map/Place/all/full-data');
    // return response.data.map((e) => parser.transform(e)).toList();
    throw UnimplementedError();
  }

  Future<Place> getPlace(String id) async {
    throw UnimplementedError();
    final response = await client.get(id);
    // return parser.transform(response.data);
  }

  Future<void> createPlace(Place place) async {
    throw UnimplementedError();
  }
}
