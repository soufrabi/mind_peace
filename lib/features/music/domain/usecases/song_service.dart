import 'package:mind_peace/features/music/domain/entity/song.dart';

class SongService {
  Future<List<Song>> getAllSongs() async {
    return [
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
  }
}
