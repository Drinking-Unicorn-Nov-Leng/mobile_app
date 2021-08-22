part of 'map_cubit.dart';

@immutable
abstract class MapState {}

class MapInitial extends MapState {}

class MapMarkerIsTouched extends MapState {
  Place place;

  MapMarkerIsTouched(this.place);
}
