import 'package:flutter/material.dart';
import 'package:music_app/core/utils/app_color.dart';

AppBar buildAppBar(
    {required String title,
    required Color backgroundColor,
    double elvation = 0}) {
  return AppBar(
    elevation: elvation,
    backgroundColor: backgroundColor,
    centerTitle: true,
    title: Text(
      title,
      style: const TextStyle(color: AppColors.inversePrimary),
    ),
  );
}
