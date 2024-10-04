import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_peace/features/music/presentation/bloc/song_bloc.dart';
import 'package:mind_peace/features/music/presentation/bloc/song_state.dart';
import 'package:mind_peace/features/music/presentation/pages/music_player_screen.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chill Playlist",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        elevation: 1,
      ),
      body: BlocBuilder<SongBloc, SongState>(builder: (context, state) {
        if (state is SongLoading) {
          // display a loader
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SongLoaded) {
          // display all information
          return ListView.builder(
            itemCount: state.songs.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(state.songs[index].thumbnail),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 15,
                ),
                title: Text(
                  state.songs[index].title,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                subtitle: Text(
                  state.songs[index].artist,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MusicPlayerScreen()));
                },
              );
            },
          );
        } else if (state is SongError) {
          return Center(
              child: Text(
            'Failed to get songs, Error : ${state.message}',
            style: Theme.of(context).textTheme.labelMedium,
          ));
        } else {
          return Center(
            child: Text(
              'No songs found',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          );
        }
      }),
    );
  }
}
