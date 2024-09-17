import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:on_audio_query/on_audio_query.dart';

abstract class MusicRepo {
  Future<Either<String, List<SongModel>>> getMusic();
  // Future<bool> getPemition();
}
