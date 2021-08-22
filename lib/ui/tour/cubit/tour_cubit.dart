import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tour_state.dart';

class TourCubit extends Cubit<TourState> {
  TourCubit() : super(TourInitial());
}
