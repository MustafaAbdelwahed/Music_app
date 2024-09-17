import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:music_app/home/domain/repos/song_repo.dart';
import 'package:on_audio_query/on_audio_query.dart';

part 'song_state.dart';

class SongCubit extends Cubit<SongState> {
  SongCubit(this.songRepo) : super(SongInitial());
  final SongRepo songRepo;

  Future<void> getSong() async {
    emit(SongLoading());
    final result = await songRepo.fetchSong();
    result.fold(
      (failure) => emit(SongFailed(failure)),
      (sucusses) => emit(SongSuccess(sucusses)),
    );
  }
}
