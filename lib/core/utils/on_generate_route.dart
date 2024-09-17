import 'package:flutter/material.dart';
import 'package:music_app/home/presentation/view/home_view.dart';
import 'package:music_app/home/presentation/view/setting_view.dart';
import 'package:music_app/home/presentation/view/song_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case SongView.routeName:
      return MaterialPageRoute(builder: (context) => const SongView());
    case SettingView.routeName:
      return MaterialPageRoute(builder: (context) => const SettingView());

    default:
      return MaterialPageRoute(builder: (context) => const HomeView());
  }
}
