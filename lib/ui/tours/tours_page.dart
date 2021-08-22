import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_app/domain/models/tour.dart';
import 'package:mobile_app/ui/tours/widgets/cubit/tours_cubit.dart';
import 'package:mobile_app/ui/tours/widgets/title_block.dart';
import 'package:mobile_app/ui/tours/widgets/tours_list.dart';
import 'package:mobile_app/utils/responsive_size.dart';

import 'widgets/add_tour_button.dart';

class ToursPage extends StatelessWidget {
  ToursPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Маршруты',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.6.width),
            child: SvgPicture.asset(
              'assets/search_icon.svg',
            ),
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => ToursCubit(),
        child: ToursPageView(),
      ),
    );
  }
}

class ToursPageView extends StatefulWidget {
  const ToursPageView({
    Key? key,
  }) : super(key: key);

  @override
  _ToursPageViewState createState() => _ToursPageViewState();
}

class _ToursPageViewState extends State<ToursPageView> {
  @override
  void initState() {
    super.initState();
    context.read<ToursCubit>().fetchTours();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TitleBlock(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.width,
            ),
            child: AddTourButton(),
          ),
          BlocBuilder<ToursCubit, ToursState>(
            builder: (context, state) {
              if (state is ToursInProgress) {
                return CircularProgressIndicator();
              } else if (state is ToursSuccess) {
                return ToursList(state.tours);
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
