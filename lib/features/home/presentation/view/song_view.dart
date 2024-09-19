import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/core/utils/app_color.dart';
import 'package:music_app/core/utils/format_duration.dart';
import 'package:music_app/core/widgets/custom_appbar.dart';
import 'package:music_app/features/home/presentation/cubit/song_cubit/song_cubit.dart';
import 'package:music_app/features/home/presentation/view/widgets/neu_box._decor.dart';
import 'package:music_app/features/home/presentation/view/widgets/neu_box.dart';
import 'package:music_app/features/home/presentation/view/widgets/slider_song.dart';

class SongView extends StatelessWidget {
  const SongView({
    super.key,
  });
  // final SongModel song;
  static const routeName = "song";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongCubit, SongState>(
      builder: (context, state) {
        if (state is SongSuccess) {
          var songCubit = context.read<SongCubit>();
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
                      song: songCubit.currentSong!,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              //  curinitDuration.toString(),
                              formatDuration(songCubit.curinitDuration),
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
                              formatDuration(songCubit.totalDuration),
                              style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                              ),
                            )
                          ]),
                    ),
                    const SliderSong(),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            songCubit.playPreviosSong(songCubit.currentSong!);
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
                            songCubit.pauseOrResume();
                          },
                          child: NeuBoxDecor(
                              child: Icon(songCubit.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow)),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            songCubit.playNextSong();
                          },
                          child: const NeuBoxDecor(
                              child: Icon(
                            Icons.skip_next,
                          )),
                        ),
                      )
                    ])
                  ]),
            ),
          );
        } else if (state is SongFailed) {
          return Scaffold(body: Center(child: Text(state.message)));
        } else {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
