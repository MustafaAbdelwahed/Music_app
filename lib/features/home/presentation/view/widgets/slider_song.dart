import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/features/home/presentation/cubit/song_cubit/song_cubit.dart';

class SliderSong extends StatelessWidget {
  const SliderSong({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongCubit, SongState>(
      builder: (context, state) {
        var songCubit = context.read<SongCubit>();
        return SliderTheme(
            data: const SliderThemeData().copyWith(
                trackShape: const RectangularSliderTrackShape(),
                thumbShape: const RoundSliderThumbShape(
                  // elevation: 0,
                  enabledThumbRadius: 6.5,
                )),
            child: Slider(
              // onChanged: (value) {},
              activeColor: Colors.blue,
              min: 0,
              // max: 5,
              max: songCubit.totalDuration.inSeconds.toDouble(),
              // value: 5,
              value: songCubit.curinitDuration > songCubit.totalDuration
                  ? songCubit.totalDuration.inSeconds.toDouble()
                  : songCubit.curinitDuration.inSeconds.toDouble(),
// onChangeEnd: ,

              onChanged: (value) {
                songCubit.seek(Duration(seconds: value.toInt()));
              },
            ));
      },
    );
  }
}
