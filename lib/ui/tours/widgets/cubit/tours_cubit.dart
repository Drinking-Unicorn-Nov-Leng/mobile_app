import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:mobile_app/domain/models/place.dart';
import 'package:mobile_app/domain/models/tour.dart';
import 'package:mobile_app/repository/place/plase_parser.dart';

part 'tours_state.dart';

class ToursCubit extends Cubit<ToursState> {
  ToursCubit() : super(ToursInProgress());

  void fetchTours() async {
    final responce = await Dio().get(
        'http://95.142.47.217:4050/map/Tour/all?IncludePlaceId=0&Take=100');
    final tours = <Tour>[];
    for (var i in responce.data as List) {
      final placesId = i['placesIds'];
      final places = <Place>[];
      for (var id in placesId) {
        places.add(await fetchPlace(id));
      }
      tours.add(
        Tour(
          avatar: i['avatar'] ??
              'https://www.bileter.ru/data/shows_logos/S/E/ajpQZ-FT95GjdzUYklpQ7f6X26N2baGl.jpg',
          description: i['description'],
          id: i['id'].toString(),
          name: i['name'],
          places: places,
        ),
      );
    }
    emit(ToursSuccess(tours));
  }

  Future<Place> fetchPlace(int id) async {
    final response = await Dio().get('http://95.142.47.217:4050/map/Place/$id');
    return PlaceParser().transform(response.data as Map<String, dynamic>);
  }
}
