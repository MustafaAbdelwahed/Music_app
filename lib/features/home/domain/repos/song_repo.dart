import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:on_audio_query/on_audio_query.dart';

abstract class SongRepo {
  Future<Either<String, List<SongModel>>> fetchSong();
  // Future<bool> getPemition();
}
