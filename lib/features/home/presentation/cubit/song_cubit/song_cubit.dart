import 'dart:math';

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
  }

  final SongRepo songRepo;

  List<SongModel> songs = [];
  List<SongModel> shuffleSongs = [];
  int? currentSongIndex;
  SongModel? currentSong;

  Random random = Random();

  bool isPlaying = false;
  bool isShuffling = false;
  bool isLooping = false;
  final AudioPlayer _audioPlayer = AudioPlayer();
  Duration curinitDuration = Duration.zero;
  Duration totalDuration = Duration.zero;

  double speed = 1.0;
  double pitch = 1.0;

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
    // _audioPlayer.setSpeed(0.9);
    // _audioPlayer.setPitch(-1.0);
    _audioPlayer.setAudioSource(AudioSource.uri(
      Uri.parse(songs[curintSongindex].uri!),
    ));

    _audioPlayer.play();
    // setSpeed(0.9);
    // setPitch(0.9);
    isPlaying = true;
  }

  void playNextSong() {
    if (currentSongIndex! < songs.length - 1) {
      currentSongIndex = currentSongIndex! + 1;
      play(currentSongIndex!);
    } else {
      currentSongIndex = 0;
      play(currentSongIndex!);
    }
  }

  void pauseOrResume() {
    if (isPlaying) {
      _audioPlayer.pause();
      isPlaying = false;
    } else {
      _audioPlayer.setSpeed(0.9);

      _audioPlayer.setPitch(0.9);

      _audioPlayer.play();
      isPlaying = true;

      // play(curintSongIndex!);
    }
    emit(SongSuccess(
        // songs: songs,
        ));
  }

  void seek(Duration position) async {
    await _audioPlayer.seek(position);
    // emit(SongSuccess(
    //     // songs: songs,
    //     ));
  }

  void currentIndex(int index, SongModel song) {
    if (index != currentSongIndex) {
      currentSong = song;
      currentSongIndex = index;
      play(index);
    }
    emit(SongSuccess());
  }

  void playPreviosSong(SongModel song) {
    if (currentSongIndex! > 0) {
      currentSongIndex = currentSongIndex! - 1;
    } else {
      currentSongIndex = songs.length - 1;
    }

    currentSong = songs[currentSongIndex!];
    play(currentSongIndex!);
    emit(SongSuccess());
  }

  void currintAndTotalduration() {
    _audioPlayer.durationStream.listen((totalduration) {
      totalDuration = totalduration!;
      emit(SongSuccess(
          // songs: songs,
          ));
    });
    _audioPlayer.positionStream.listen((curinitduration) {
      curinitDuration = curinitduration;
      emit(SongSuccess());
    });
    _audioPlayer.playerStateStream.listen((playerState) {
      if (playerState.processingState == ProcessingState.completed) {
        playNextSong();
      }
    });
  }

  void toggleLooping() {
    if (isLooping) {
      // _audioPlayer.setShuffleModeEnabled();
      _audioPlayer.setLoopMode(LoopMode.off);
    } else {
      _audioPlayer.setLoopMode(LoopMode.one);
    }

    isLooping = !isLooping;
    emit(SongSuccess());
  }

  void setSpeed(double speed) {
    this.speed = speed;
    _audioPlayer.setSpeed(speed);
    emit(SongSuccess());
  }

  void setPitch(double pitch) {
    this.pitch = pitch;
    _audioPlayer.setPitch(pitch / 10);
    // _audioPlayer.setPitch(pitch);
    emit(SongSuccess());
  }

  // void toggleShuffle() {
  //   isShuffling = !isShuffling;

  //   // _audioPlayer.setShuffleModeEnabled();
  //   _audioPlayer.setShuffleModeEnabled(true);
  //   print("////////////////////////////////////////////////////////");
  //   print(isShuffling);
  //   print("////////////////////////////////////////////////////////");

  //   // songs.shuffle(random);
  //   // _audioPlayer.shuffle();
  //   // currentSongIndex = Random().nextInt(songs.length - 1);
  //   // print("////////////////////////////////////////////////////////");
  //   // print(currentSongIndex);
  //   // print("////////////////////////////////////////////////////////");
  //   // play(currentSongIndex!);
  // }
}
