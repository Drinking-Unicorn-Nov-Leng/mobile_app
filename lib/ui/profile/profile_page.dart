import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';
import 'package:mobile_app/ui/profile/widgets/oportunity_block.dart';
import 'widgets/rewards_block.dart';
import 'widgets/title_block.dart';
import 'package:mobile_app/utils/responsive_size.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Профиль',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.6.width),
            child: SvgPicture.asset(
              'assets/settings_icon.svg',
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TitleBlock(),
            RewardsBlock(),
            OportunityBlock(),
          ],
        ),
      ),
    );
  }
}
