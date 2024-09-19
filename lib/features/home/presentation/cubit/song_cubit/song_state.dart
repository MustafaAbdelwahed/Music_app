part of 'song_cubit.dart';

@immutable
sealed class SongState {}

final class SongInitial extends SongState {}

final class SongLoading extends SongState {}

final class SongFailed extends SongState {
  final String message;

  SongFailed(this.message);
}

final class SongSuccess extends SongState {
  // final List<SongModel>? songs;
  // final SongModel? currentsong;
  // final int? currentSongIndex;

  // SongSuccess({
  //   // this.currentsong,
  //   // this.songs,
  //   // this.currentSongIndex,
  // });
}

// final class CurrintSong extends SongState {
//   final SongModel song;

//   CurrintSong(this.song);
// }
