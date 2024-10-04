import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_peace/features/music/domain/entity/song.dart';
import 'package:mind_peace/features/music/domain/usecases/song_service.dart';
import 'package:mind_peace/features/music/presentation/bloc/song_event.dart';
import 'package:mind_peace/features/music/presentation/bloc/song_state.dart';

class SongBloc extends Bloc<SongEvent, SongState> {
  SongService songService;
  SongBloc({required this.songService}) : super(SongInitial()) {
    on<FetchSongs>((event, emit) async {
      emit(SongLoading());
      try {
        final List<Song> songs = await songService.getAllSongs();
        emit(SongLoaded(songs: songs));
      } catch (e) {
        emit(SongError(message: e.toString()));
      }
    });
  }
}
