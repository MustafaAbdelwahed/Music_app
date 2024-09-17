import 'package:dartz/dartz.dart';
import 'package:music_app/home/domain/repos/song_repo.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongRepoImpl extends SongRepo {
  @override
  Future<Either<String, List<SongModel>>> fetchSong() async {
    await OnAudioQuery().permissionsRequest();
    bool isPermition = await OnAudioQuery().permissionsStatus();
    if (isPermition) {
      final OnAudioQuery audioQuery = OnAudioQuery();
      List<SongModel> songs = [];
      try {
        songs = await audioQuery.querySongs(
            ignoreCase: true,
            uriType: UriType.EXTERNAL,
            orderType: OrderType.ASC_OR_SMALLER,
            sortType: null);

        print(songs.length);
        if (songs.isEmpty) {
          return left("not Found Songs");
        } else {
          songs = songs
              .where((song) => song.duration != null && song.duration! >= 20000)
              .toList();
        }
        return right(songs);
      } on Exception {
        return left("not Found Sodsdsangs");
      }
    }
    return left("Permission Denied");
  }

  // @override
  // Future<bool> getPemition() {
  //   return OnAudioQuery().requestPermission();
  // }
}
