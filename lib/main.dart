import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/core/utils/app_color.dart';
import 'package:music_app/core/utils/get_it.dart';
import 'package:music_app/core/utils/on_generate_route.dart';
import 'package:music_app/home/presentation/cubit/song_cubit/song_cubit.dart';
import 'package:music_app/home/presentation/view/home_view.dart';
import 'package:music_app/test.dart';

void main() {
  initGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SongCubit(getIt())..getSong(),
      child: MaterialApp(
          onGenerateRoute: onGenerateRoute,
          initialRoute: TestView.routeName,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryColor,
              secondary: AppColors.secondaryColor,
              inversePrimary: AppColors.inversePrimary,
            ),
            useMaterial3: true,
          ),
          home: const HomeView()),
    );
  }
}


// <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
//     <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>