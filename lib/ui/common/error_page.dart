import 'package:flutter/material.dart';
import 'package:mobile_app/ui/common/app_colors.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Path not found",
          style: TextStyle(
            color: AppColors.error,
          ),
        ),
      ),
    );
  }
}
