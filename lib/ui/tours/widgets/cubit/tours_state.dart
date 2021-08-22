part of 'tours_cubit.dart';

@immutable
abstract class ToursState {}

class ToursSuccess extends ToursState {
  List<Tour> tours;

  ToursSuccess(this.tours);
}

class ToursInProgress extends ToursState {}
