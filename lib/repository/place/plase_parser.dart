import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_app/domain/models/category.dart';
import 'package:mobile_app/domain/models/place.dart';

class PlaceParser {
  Future<Place> transform(Map<String, dynamic> data) async {
    final adress = await placemarkFromCoordinates(
      data['coordinates']['lat'],
      data['coordinates']['lng'],
    );
    return Place(
      adress: adress.first.name ?? 'Мухосранск',
      audioGidUrl: data['audioGuide'],
      audioStoryUrl: data['audioHistory'],
      category: fromJson(data['type']),
      description: data['description'],
      id: data['id'].toString(),
      location: LatLng(
        data['coordinates']['lat'],
        data['coordinates']['lng'],
      ),
      name: data['name'],
      phone: '89518223545',
      photoUrls: (data['pictures'] as List).map((e) => e.toString()).toList(),
      city: 'Великий новгород',
      shortDescription: data['smallDescription'],
      site: 'https://music.yandex.ru/artist/5963126',
    );
  }

  Category fromJson(int type) {
    if (type == 0) {
      return Category(
        iconPath: 'assets/museum_icon.svg',
        name: 'Музеи',
        isActive: true,
      );
    } else if (type == 1) {
      return Category(
        iconPath: 'assets/monument_icon.svg',
        name: 'Памятники',
        isActive: false,
      );
    } else {
      return Category(
        iconPath: 'assets/epic_icon.svg',
        name: 'Былины',
        isActive: true,
      );
    }
  }
}
