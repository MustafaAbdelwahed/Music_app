import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/core/utils/app_color.dart';
import 'package:music_app/features/home/presentation/cubit/song_cubit/song_cubit.dart';
import 'package:music_app/features/home/presentation/view/song_view.dart';
import 'package:on_audio_query/on_audio_query.dart';

class CutomListTile extends StatelessWidget {
  const CutomListTile({
    super.key,
    required this.song,
    required this.index,
  });
  final SongModel song;
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongCubit, SongState>(
      builder: (context, state) {
        return ListTile(
          tileColor:
              isThisSong(index, context.read<SongCubit>().currentSongIndex)
                  ? AppColors.primaryColor.withOpacity(0.3)
                  : null,
          onTap: () {
            context.read<SongCubit>().currentIndex(index, song);
            Navigator.pushNamed(context, SongView.routeName);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SongView()));
          },
          leading: QueryArtworkWidget(
            keepOldArtwork: true,
            nullArtworkWidget: Container(
              width: 50,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: const Icon(
                Icons.music_note,
                size: 30,
              ),
            ),
            id: song.id,
            type: ArtworkType.AUDIO,
            artworkBorder: BorderRadius.circular(5),
          ),
          title: Text(
            // "Song Name",
            song.title,
            maxLines: 1,
            style: const TextStyle(overflow: TextOverflow.ellipsis),
          ),
          subtitle: Text(
            // " Artist name",
            song.artist ?? "Unknown Artist",
            maxLines: 1,
            style: const TextStyle(overflow: TextOverflow.ellipsis),
          ),
          trailing:
              isThisSong(index, context.read<SongCubit>().currentSongIndex)
                  ? const Icon(Icons.play_arrow)
                  : null,
        );
      },
    );
  }

  bool isThisSong(int index, int? currentIndex) {
    return index == currentIndex;
  }
}
