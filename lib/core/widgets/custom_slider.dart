import 'package:flutter/material.dart';
import 'package:music_app/features/home/presentation/cubit/song_cubit/song_cubit.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({
    super.key,
    this.songCubit,
    required this.min,
    required this.max,
    this.onChanged,
    required this.value,
  });

  final SongCubit? songCubit;
  final double min, max, value;
  final Function(double)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: const SliderThemeData().copyWith(
          trackShape: const RectangularSliderTrackShape(),
          thumbShape: const RoundSliderThumbShape(
            // elevation: 0,
            enabledThumbRadius: 6.5,
          )),
      child: Slider(
          value: value,
          min: min,
          max: max,
          divisions: 10,
          onChanged: onChanged),
    );
  }
}
