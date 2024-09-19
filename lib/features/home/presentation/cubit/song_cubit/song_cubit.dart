import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:music_app/features/home/domain/repos/song_repo.dart';
import 'package:on_audio_query/on_audio_query.dart';

part 'song_state.dart';

class SongCubit extends Cubit<SongState> {
  SongCubit(this.songRepo) : super(SongInitial());

  final SongRepo songRepo;

  List<SongModel> songs = [];
  int? currentSongIndex;
  SongModel? currentSong;

  Future<void> getSong() async {
    emit(SongLoading());
    final result = await songRepo.fetchSong();

    result.fold((failure) => null, (sucusses) => songs = sucusses);

    result.fold(
      (failure) => emit(SongFailed(failure)),
      (sucusses) => emit(SongSuccess(songs: sucusses)),
    );
  }

  void currentIndex(int index, SongModel song) {
    currentSong = song;
    currentSongIndex = index;
    emit(SongSuccess(songs: songs, currentsong: currentSong));
  }

  void previosSong(SongModel song) {
    if (currentSongIndex! > 0) {
      currentSongIndex = currentSongIndex! - 1;
    } else {
      currentSongIndex = songs.length - 1;

      // }
      // notifyListeners();
    }

    currentSong = songs[currentSongIndex!];

    emit(SongSuccess(
        songs: songs,
        currentsong: currentSong,
        currentSongIndex: currentSongIndex));
  }

  void skipSong(SongModel song) {
    if (currentSongIndex! < songs.length - 1) {
      currentSongIndex = currentSongIndex! + 1;
    } else {
      currentSongIndex = 0;
    }
    currentSong = songs[currentSongIndex!];

    emit(SongSuccess(
        songs: songs,
        currentsong: currentSong,
        currentSongIndex: currentSongIndex));
  }
}
