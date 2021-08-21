import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navigator_state.dart';

class NavigatorCubit extends Cubit<NavigatorStates> {
  NavigatorCubit() : super(NavigatorStates.Map);

  void navigateTo(NavigatorStates destination) {
    emit(destination);
  }
}
