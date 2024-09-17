import 'package:dartz/dartz.dart';
import 'package:music_app/home/domain/repos/music_repo.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MusicRepoImpl extends MusicRepo {
  @override
  Future<Either<String, List<SongModel>>> getMusic() async {
    await OnAudioQuery().permissionsRequest();
    bool isPermition = await OnAudioQuery().permissionsStatus();
    if (isPermition) {
      final OnAudioQuery audioQuery = OnAudioQuery();

      try {
        List<SongModel> songs = await audioQuery.querySongs(
            ignoreCase: true,
            uriType: UriType.EXTERNAL,
            orderType: OrderType.ASC_OR_SMALLER,
            sortType: null);
        songs = songs
            .where((song) => song.duration != null && song.duration! >= 20000)
            .toList();
        return right(songs);
      } on Exception catch (e) {
        return left("not Found Songs");
      }
    }
    return left("Permission Denied");
  }

  // @override
  // Future<bool> getPemition() {
  //   return OnAudioQuery().requestPermission();
  // }
}
