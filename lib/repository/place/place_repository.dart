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
    final response = await client.get(':4050/map/Place/all/full-data?Take=500');
    final places = <Place>[];
    for (var item in response.data) {
      if (item['coordinates']['lat'] > 100 ||
          item['coordinates']['lat'] == 0 ||
          item['coordinates']['lat'] < 20) {
        continue;
      }
      places.add(await parser.transform(item));
    }
    print(places.length);
    return places;
  }
}
