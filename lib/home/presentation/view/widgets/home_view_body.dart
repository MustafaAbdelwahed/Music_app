import 'package:flutter/material.dart';
import 'package:music_app/home/presentation/view/widgets/cutom_list_tile.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return const CutomListTile();
      },
    );
  }
}
