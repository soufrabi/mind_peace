import 'package:flutter/material.dart';
import 'package:mind_peace/features/music/presentation/music_player_screen.dart';

class Song {
  final String title;
  final String artist;
  final String thumbnail;

  Song({required this.title, required this.artist, required this.thumbnail});
}

class PlaylistScreen extends StatelessWidget {
  PlaylistScreen({super.key});

  final List<Song> songs = [
    Song(
      title: "Rain on Glass",
      artist: "Rain on Glass",
      thumbnail: "assets/child_with_dog.png",
    ),
    Song(
      title: "Gentle Breeze",
      artist: "Soothing Sounds",
      thumbnail: "assets/child_with_dog.png",
    ),
    Song(
      title: "Ocean Waves Breeze",
      artist: "Soothing Sounds",
      thumbnail: "assets/child_with_dog.png",
    )
  ];

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
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(songs[index].thumbnail),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 15,
            ),
            title: Text(
              songs[index].title,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            subtitle: Text(
              songs[index].artist,
              style: Theme.of(context).textTheme.labelSmall,
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MusicPlayerScreen()));
            },
          );
        },
      ),
    );
  }
}
