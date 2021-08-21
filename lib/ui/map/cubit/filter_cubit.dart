import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile_app/domain/models/filter.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  List<Filter> filters;

  FilterCubit({List<Filter>? filters})
      : this.filters = filters ??
            [
              Filter(
                iconPath: 'assets/epic_icon.svg',
                name: 'Былины',
                isActive: true,
              ),
              Filter(
                iconPath: 'assets/monument_icon.svg',
                name: 'Памятники',
                isActive: false,
              ),
              Filter(
                iconPath: 'assets/museum_icon.svg',
                name: 'Музеи',
                isActive: true,
              ),
              Filter(
                iconPath: 'assets/cafe_icon.svg',
                name: 'Где покушать',
                isActive: true,
              ),
              Filter(
                iconPath: 'assets/souvenirs_icon.svg',
                name: 'Сувениры',
                isActive: true,
              ),
              Filter(
                iconPath: 'assets/travelers_icon.svg',
                name: 'Пользователи',
                isActive: true,
              ),
            ],
        super(FilterInitial());

  void updateFilter(Filter filter) {
    int index = filters.indexWhere((element) => filter.name == element.name);
    filters[index] = filter;
  }
}
