import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/ui/common/error_page.dart';
import 'package:mobile_app/ui/home/home_page.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    if (settings.name == HomePage.route) {
      return MaterialPageRoute(
        builder: (_) => HomePage(),
      );
    }
    return MaterialPageRoute(
      builder: (_) => ErrorPage(),
    );
  }
}
