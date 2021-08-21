import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/domain/map/map_service.dart';
import 'package:mobile_app/ui/home/cubit/navigator_cubit.dart';
import 'package:mobile_app/ui/home/widgets/flying_navigation_bar.dart';
import 'package:mobile_app/ui/map/cubit/map_cubit.dart';
import 'package:mobile_app/ui/map/map_page.dart';
import 'package:mobile_app/ui/profile/profile_page.dart';
import 'package:mobile_app/ui/routes/routes_page.dart';
import 'package:mobile_app/utils/config.dart';
import 'package:mobile_app/utils/responsive_size.dart';

class HomePage extends StatelessWidget {
  static const route = '/';
  const HomePage();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MapCubit(MapService()),
        ),
        BlocProvider(
          create: (context) => NavigatorCubit(),
        )
      ],
      child: HomePageView(),
    );
  }
}

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  void initState() {
    super.initState();
    getIt.registerSingleton<MapService>(MapService());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            BlocBuilder<NavigatorCubit, NavigatorStates>(
              builder: (context, state) {
                if (state == NavigatorStates.Routes) {
                  return RoutesPage();
                } else if (state == NavigatorStates.Map) {
                  return MapPage();
                }
                return ProfilePage();
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: FlyingBavigationBar(
                context.select(
                  (NavigatorCubit c) => c.state.index,
                ),
                (int index) {
                  context
                      .read<NavigatorCubit>()
                      .navigateTo(NavigatorStates.values[index]);
                },
              ),
            ),
            BlocBuilder<MapCubit, MapState>(
              builder: (context, state) {
                if (state is MapMarkerIsTouched) {
                  return SizedBox.expand(
                    child: DraggableScrollableSheet(
                      builder: (BuildContext context,
                          ScrollController scrollController) {
                        return Container(
                          color: Colors.blue[100],
                          child: ListView.builder(
                            controller: scrollController,
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                title: Text('Item ${state.place}'),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  );
                }
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}
