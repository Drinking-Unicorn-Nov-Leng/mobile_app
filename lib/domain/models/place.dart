import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_app/domain/models/category.dart';

class Place {
  String id;
  String name;
  String? shortDescription;
  String? description;
  String? phone;
  String? site;
  String? city;
  String? adress;
  LatLng? location;
  Category? category;
  List<String> photoUrls;
  String? audioGidUrl;
  String? audioStoryUrl;

  Place({
    required this.id,
    required this.audioStoryUrl,
    required this.adress,
    required this.audioGidUrl,
    required this.description,
    required this.location,
    required this.name,
    required this.phone,
    required this.photoUrls,
    required this.shortDescription,
    required this.site,
    required this.city,
    required this.category,
  });

  Place.getBlank()
      : adress =
            "Новгородский район, пос. Тёсово-Нетыльский, Советская, д. 116",
        audioGidUrl = "",
        audioStoryUrl = "",
        description = '''
        Основан в 2015 году выпускниками Малой Октябрьской детской железной дороги. Основная миссия - поиск, сохранение, восстановление и популяризация узкоколейного наследия СССР.

Экспозиция Музея насчитывает свыше 50 единиц техники, из них - восстановленная с нуля, единственная на данный момент в России и единственная в мире с «родными» заводскими деталями автомотриса АМ1-169.

По Карте гостя БЕСПЛАТНАЯ ЭКСКУРСИЯ по действующей узкоколейной железной дороге на торфоразработки. 

Экскурсия знакомит гостей с историей узкоколейных железных дорог.
Неотъемлемой частью экскурсии является поездка на узкоколейном поезде. В летнее время поездка может быть осуществлена на открытой мотодрезине. 

ВНИМАНИЕ !! Обувь во время экскурсии обязательно должна быть удобной и закрытой, большая часть экскурсии проходит вне помещения!

Дети до 5 лет бесплатно. Длительность экскурсии: 3,5–4 часа''',
        id = "123",
        location = LatLng(58.534363, 31.261617),
        name = "МУЗЕЙ ТЁСОВСКОЙ УЗКОКОЛЕЙНОЙ ЖЕЛЕЗНОЙ ДОРОГИ",
        phone = "+7 (905) 207-75-83",
        photoUrls = [
          "https://novgorodcard.ru/vn/upload/information_system_25/1/6/2/item_1626/item_1626.jpg",
          "https://nacion.ru/assets/i/ai/4/7/8/i/3287622.jpg",
          "https://media.macphun.com/img/uploads/customer/how-to/579/15531840725c93b5489d84e9.43781620.jpg?q=85&w=1340",
        ],
        shortDescription =
            "Уникальный железнодорожный музей под открытым небом на территории действующей Тёсовской УЖД расположен в посёлке Тёсово-Нетыльский в 1 часеезды от Великого Новгорода.",
        site = "https://www.tesovouzd.ru",
        city = "Тёсово-Нетыльский",
        category = Category(
          iconPath: 'assets/monument_icon.svg',
          name: 'Музей',
          isActive: false,
        );
}
