import 'package:flutter/material.dart';
import 'package:mobile_app/ui/map/cubit/category_cubit.dart';
import 'package:mobile_app/ui/map/widgets/category_item.dart';
import 'package:mobile_app/utils/responsive_size.dart';
import 'package:provider/provider.dart';

showCategorys(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context1) {
      return BottomSheetView(context);
    },
  );
}

class BottomSheetView extends StatelessWidget {
  final BuildContext context;
  const BottomSheetView(this.context);

  @override
  Widget build(_) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(top: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 4.height,
            width: 20.width,
            decoration: BoxDecoration(
              color: Color(0xffDDDDE0),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          SizedBox(
            height: 4.height,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 25.width,
              bottom: 16.height,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Фильтры',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Column(
            children: context
                .watch<CategoryCubit>()
                .Categorys
                .map(
                  (e) => Column(
                    children: [
                      Container(
                        height: 1,
                        color: Color(0xffE6E6EB),
                      ),
                      Categoryitem(
                        e,
                        (val) => context.read<CategoryCubit>().updateCategory(
                              e..isActive = val,
                            ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
