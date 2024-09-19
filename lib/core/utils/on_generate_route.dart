import 'package:flutter/material.dart';
import 'package:music_app/features/home/presentation/view/home_view.dart';
import 'package:music_app/features/home/presentation/view/setting_view.dart';
import 'package:music_app/features/splash/presentaion/view/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    // case TestView.routeName:
    //   return MaterialPageRoute(builder: (context) => const TestView());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    // case SongView.routeName:
    //   return MaterialPageRoute(builder: (context) => const SongView());
    case SettingView.routeName:
      return MaterialPageRoute(builder: (context) => const SettingView());
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());

    default:
      return MaterialPageRoute(builder: (context) => const HomeView());
  }
}
