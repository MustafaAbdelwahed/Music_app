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
  final List<SongModel> song;

  SongSuccess(this.song);
}
