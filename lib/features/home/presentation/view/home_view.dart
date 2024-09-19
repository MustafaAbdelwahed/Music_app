import 'package:flutter/material.dart';
import 'package:music_app/core/utils/app_color.dart';
import 'package:music_app/core/widgets/custom_appbar.dart';
import 'package:music_app/core/widgets/custom_drawer.dart';
import 'package:music_app/features/home/presentation/view/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = "home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: buildAppBar(
          backgroundColor: AppColors.primaryColor, title: "P L A Y L I S T"),
      drawer: const CustomDrawer(),
      body: const HomeViewBody(),
    );
  }
}
