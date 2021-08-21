import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile_app/domain/map/map_service.dart';
import 'package:mobile_app/domain/models/place.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapService mapService;

  MapCubit(
    this.mapService,
  ) : super(MapInitial());

  void markerIsTouched(String placeId) {
    emit(MapMarkerIsTouched(placeId));
  }

  void markerIsUntouched() {
    emit(MapInitial());
  }
}
