import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mobile_app/domain/models/place.dart';
import 'package:mobile_app/repository/common/parser.dart';

class PlaceRepository {
  Dio client;
  Parser<Place> parser;

  PlaceRepository({
    required this.client,
    required this.parser,
  });

  Future<List<Place>> getAllPlaces() async {
    final response = await client.get('');
    throw UnimplementedError();
  }

  Future<Place> getPlace(String id) async {
    final response = await client.get(id);
    return parser.transform(response.data);
    throw UnimplementedError();
  }

  Future<void> createPlace(Place place) async {
    throw UnimplementedError();
  }
}
