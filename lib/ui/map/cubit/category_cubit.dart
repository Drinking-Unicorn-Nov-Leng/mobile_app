import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile_app/domain/models/category.dart';
import 'package:mobile_app/ui/map/cubit/category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  List<Category> Categorys;

  CategoryCubit({List<Category>? Categorys})
      : this.Categorys = Categorys ??
            [
              Category(
                iconPath: 'assets/epic_icon.svg',
                name: 'Былины',
                isActive: true,
              ),
              Category(
                iconPath: 'assets/monument_icon.svg',
                name: 'Памятники',
                isActive: false,
              ),
              Category(
                iconPath: 'assets/museum_icon.svg',
                name: 'Музеи',
                isActive: true,
              ),
              Category(
                iconPath: 'assets/cafe_icon.svg',
                name: 'Где покушать',
                isActive: true,
              ),
              Category(
                iconPath: 'assets/souvenirs_icon.svg',
                name: 'Сувениры',
                isActive: true,
              ),
              Category(
                iconPath: 'assets/travelers_icon.svg',
                name: 'Пользователи',
                isActive: true,
              ),
            ],
        super(CategoryInitial());

  void updateCategory(Category Category) {
    int index =
        Categorys.indexWhere((element) => Category.name == element.name);
    Categorys[index] = Category;
  }
}
