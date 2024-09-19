import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:meta/meta.dart';
import 'package:music_app/features/home/domain/repos/song_repo.dart';
import 'package:on_audio_query/on_audio_query.dart';

part 'song_state.dart';

class SongCubit extends Cubit<SongState> {
  SongCubit(this.songRepo) : super(SongInitial()) {
    currintAndTotalduration();
    // _listenForCompletion();
  }

  final SongRepo songRepo;

  List<SongModel> songs = [];
  int? currentSongIndex;
  SongModel? currentSong;

  bool isPlaying = false;
  AudioPlayer audioPlayer = AudioPlayer();
  Duration curinitDuration = Duration.zero;
  Duration totalDuration = Duration.zero;

  Future<void> getSong() async {
    emit(SongLoading());
    final result = await songRepo.fetchSong();

    result.fold(
      (failure) => emit(SongFailed(failure)),
      (sucusses) {
        songs = sucusses;
        emit(SongSuccess());
      },
    );
  }

  void play(int curintSongindex) async {
    currentSongIndex = curintSongindex;
    currentSong = songs[currentSongIndex!];

    audioPlayer.setAudioSource(AudioSource.uri(
      Uri.parse(songs[curintSongindex].uri!),
    ));
    audioPlayer.play();
    isPlaying = true;

    // audioPlayer.playerStateStream.listen((playerState) {
    //   if (playerState.processingState == ProcessingState.completed) {
    //     playNextSong();
    //   }
    // });
  }

  // void _listenForCompletion() {
  //   audioPlayer.playerStateStream.listen((playerState) {
  //     if (playerState.processingState == ProcessingState.completed) {
  //       // Check if there is a next song in the playlist
  //       if (currentSongIndex! < songs.length - 1) {
  //         currentSongIndex = currentSongIndex! + 1;
  //         play(currentSongIndex!);
  //       } else {
  //         // Optionally, restart from the first song or stop playing
  //         audioPlayer.stop();
  //       }
  //     }
  //   });
  // }

  void playNextSong() {
    // print("//////////////////////////////////////////////");

    // print(currentSongIndex);
    // print("//////////////////////////////////////////////");

    // if (currentSongIndex! < songs.length - 1) {
    //   currentSongIndex = currentSongIndex! + 1;
    // } else {
    //   currentSongIndex = 0;
    // }
    // print(currentSongIndex);

    // currentSong = songs[currentSongIndex!];
    // play(currentSongIndex!);

    // emit(SongSuccess());
    if (currentSongIndex! < songs.length - 1) {
      currentSongIndex = currentSongIndex! + 1;
      play(currentSongIndex!);
    } else {
      // Optionally, restart from the first song or stop playing
      currentSongIndex = 0;
      play(currentSongIndex!);

      // audioPlayer.stop();
    }
  }

  void seek(Duration position) async {
    await audioPlayer.seek(position);
  }

  void pauseOrResume() {
    if (isPlaying) {
      audioPlayer.pause();
      isPlaying = false;
    } else {
      audioPlayer.play();
      isPlaying = true;

      // play(curintSongIndex!);
    }
    emit(SongSuccess(
        // songs: songs,
        ));
  }

  void currentIndex(int index, SongModel song) {
    if (index != currentSongIndex) {
      currentSong = song;
      currentSongIndex = index;
      play(index);
    }
    emit(SongSuccess(
        // songs: songs,
        ));
  }

  void playPreviosSong(SongModel song) {
    if (currentSongIndex! > 0) {
      currentSongIndex = currentSongIndex! - 1;
    } else {
      currentSongIndex = songs.length - 1;
    }

    currentSong = songs[currentSongIndex!];
    play(currentSongIndex!);
    emit(SongSuccess(
        // songs: songs,
        // currentsong: currentSong,
        // currentSongIndex: currentSongIndex
        ));
  }

  void currintAndTotalduration() {
    audioPlayer.durationStream.listen((totalduration) {
      totalDuration = totalduration!;
      emit(SongSuccess(
          // songs: songs,
          ));
    });
    audioPlayer.positionStream.listen((curinitduration) {
      curinitDuration = curinitduration;
      emit(SongSuccess(
          // songs: songs,
          ));
    });
    audioPlayer.playerStateStream.listen((playerState) {
      if (playerState.processingState == ProcessingState.completed) {
        playNextSong();
        // Check if there is a next song in the playlist
      }
    });
  }
}
