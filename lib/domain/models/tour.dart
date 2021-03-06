import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_app/domain/models/place.dart';

class Tour {
  String id;
  String name;
  String avatar;
  String description;
  List<Place> places;

  Tour({
    required this.id,
    required this.name,
    required this.avatar,
    required this.description,
    required this.places,
  });

  Tour.getBlank()
      : id = '1',
        avatar =
            'https://www.bileter.ru/data/shows_logos/S/E/ajpQZ-FT95GjdzUYklpQ7f6X26N2baGl.jpg',
        name = 'Дорога на мельницу',
        description =
            'Увлекательное путешествие по Ильменьскому Поозерью. Главная цель—посещение музея Мельницы в деревне Завал.',
        places = [
          Place.getBlank(),
          Place.getBlank()
            ..location = LatLng(58.535363, 31.299617)
            ..id = '1213',
          Place.getBlank()
            ..location = LatLng(58.515363, 31.219617)
            ..id = '123321',
        ];
}
