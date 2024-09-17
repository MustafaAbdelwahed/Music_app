import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/core/utils/app_color.dart';
import 'package:music_app/core/widgets/custom_appbar.dart';
import 'package:music_app/home/presentation/cubit/song_cubit/song_cubit.dart';
import 'package:music_app/home/presentation/view/widgets/neu_box._decor.dart';
import 'package:music_app/home/presentation/view/widgets/neu_box.dart';
import 'package:music_app/home/presentation/view/widgets/slider_song.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongView extends StatelessWidget {
  const SongView({super.key, required this.song});
  final SongModel song;
  static const routeName = "song";
  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongCubit, SongState>(
      builder: (context, state) {
        if (state is SongLoading || state is SongInitial) {
          return const Scaffold(body: CircularProgressIndicator());
        } else if (state is SongSuccess) {
          return Scaffold(
            backgroundColor: AppColors.scaffoldBackgroundColor,
            appBar: buildAppBar(
              title: "S O N G ",
              backgroundColor: Colors.transparent,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NueBox(
                    song: song,
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              //  curinitDuration.toString(),
                              _formatDuration(Duration.zero),
                              style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                              ),
                            ),
                            Icon(
                              Icons.shuffle,
                              size: 25,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                            ),
                            Icon(
                              Icons.repeat,
                              size: 25,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                            ),
                            Text(
                              _formatDuration(Duration.zero),
                              style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SliderSong(),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    // playlistProv.playPreviosSong();

                                    // curintSong(playlistProv.curintSongIndex);

                                    // playeing = true;
                                  },
                                  child: const NeuBoxDecor(
                                      child: Icon(
                                    Icons.skip_previous,
                                  )),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 2,
                                child: GestureDetector(
                                  onTap: () {
                                    // playlistProv.play();

                                    // playlistProv.pauseOrResume();
                                    // playlistProv.pauseOrResume();
                                    // playeing = !playeing;
                                  },
                                  child: const NeuBoxDecor(
                                      child: Icon(
                                    Icons.play_arrow,
                                    // playlistProv.isPlaying
                                    //     ? Icons.pause
                                    //     : Icons.play_arrow,
                                  )),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    // playlistProv.playNextSong();

                                    // curintSong(playlistProv.curintSongIndex);

                                    // playeing = true;
                                  },
                                  child: const NeuBoxDecor(
                                      child: Icon(
                                    Icons.skip_next,
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  )

                  // SliderTheme(
                  //   data: const SliderThemeData().copyWith(
                  //       thumbShape:
                  //           const RoundSliderThumbShape(enabledThumbRadius: 0)),
                  //   child: Slider(
                  //     value: 50,
                  //     min: 0,
                  //     max: 100,
                  //     activeColor: Colors.blue.shade900,
                  //     onChanged: (value) {},
                  //     onChangeEnd: (double) {
                  //       playlistProv.seek(Duration(seconds: double.toInt()));
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
          );
        } else {
          return Scaffold(body: const Text("Not Found Song"));
        }
      },
    );
  }
}
