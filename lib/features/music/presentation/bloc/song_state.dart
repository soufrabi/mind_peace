import 'package:mind_peace/features/music/domain/entity/song.dart';

abstract class SongState {}

class SongInitial extends SongState {}

class SongLoading extends SongState {}

class SongLoaded extends SongState {
  final List<Song> songs;

  SongLoaded({required this.songs});
}

class SongError extends SongState {
  final String message;

  SongError({required this.message});
}
