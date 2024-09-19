import 'package:flutter/material.dart';

class SliderSong extends StatelessWidget {
  const SliderSong({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
        data: const SliderThemeData().copyWith(
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 0)),
        child: Slider(
          activeColor: Colors.blue,
          min: 0,
          max: 5,
          // max: playlistProv.totalDuration.inSeconds.toDouble(),
          // max: totalDuration,
          value: 5,
          // value: curinitDuration > totalDuration
          //     ? totalDuration
          //     : curinitDuration,

          onChanged: (value) {
            // playlistProv.seek(Duration(seconds: value.toInt()));
          },
        ));
  }
}
