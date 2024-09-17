import 'package:get_it/get_it.dart';
import 'package:music_app/home/domain/repos/song_repo.dart';
import 'package:music_app/home/domain/repos/song_repo_impl.dart';

final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerSingleton<SongRepo>(SongRepoImpl());
}
