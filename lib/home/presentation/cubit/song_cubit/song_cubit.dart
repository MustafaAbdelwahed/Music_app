import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:music_app/home/domain/repos/music_repo.dart';
import 'package:on_audio_query/on_audio_query.dart';

part 'song_state.dart';

class SongCubit extends Cubit<SongState> {
  SongCubit(this.songRepo) : super(SongInitial());
  final MusicRepo songRepo;

  Future<void> getMusic() async {
    emit(SongLoading());
    final result = await songRepo.getMusic();
    result.fold(
      (failure) => emit(SongFailed(failure)),
      (sucusses) => emit(SongSuccess(sucusses)),
    );
  }
}
