import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/features/home/presentation/cubit/song_cubit/song_cubit.dart';
import 'package:music_app/features/home/presentation/view/widgets/cutom_list_tile.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongCubit, SongState>(builder: (context, state) {
      var songCubit = context.read<SongCubit>();
      if (state is SongLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is SongSuccess) {
        return ListView.builder(
            itemCount: songCubit.songs.length,
            itemBuilder: (context, index) {
              return CutomListTile(
                index: index,
                song: songCubit.songs[index],
              );
            });
      } else if (state is SongFailed) {
        return Center(child: Text(state.message));
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
