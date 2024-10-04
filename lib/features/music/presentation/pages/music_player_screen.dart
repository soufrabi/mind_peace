import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_media_kit/just_audio_media_kit.dart';
import 'package:mind_peace/core/theme.dart';

class MusicPlayerScreen extends StatefulWidget {
  const MusicPlayerScreen({super.key});

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  late AudioPlayer _audioPlayer;
  bool isLooping = false;

  @override
  void initState() {
    const String url =
        'https://www2.cs.uic.edu/~i101/SoundFiles/BabyElephantWalk60.wav';
    JustAudioMediaKit.ensureInitialized(
      linux: true,
      // default: true  - dependency: media_kit_libs_linux
      windows: false,
      // default: true  - dependency: media_kit_libs_windows_audio
      android: false,
      // default: false - dependency: media_kit_libs_android_audio
      iOS: false,
      // default: false - dependency: media_kit_libs_ios_audio
      macOS: false,
      // default: false - dependency: media_kit_libs_macos_audio
    );

    _audioPlayer = AudioPlayer();
    _audioPlayer.setUrl(url);
    super.initState();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void togglePlayPause() {
    if (_audioPlayer.playing) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play();
    }
  }

  void seekForward() {
    final currentPosition = _audioPlayer.position;
    var newPosition = currentPosition + const Duration(seconds: 10);
    final duration = _audioPlayer.duration;
    if (duration != null && newPosition > duration) {
      newPosition = duration;
    }
    _audioPlayer.seek(newPosition);
  }

  void seekBackward() {
    final currentPosition = _audioPlayer.position;
    var newPosition = currentPosition - const Duration(seconds: 10);
    if (newPosition < Duration.zero) {
      newPosition = Duration.zero;
    }
    _audioPlayer.seek(newPosition);
  }

  void seekRestart() {
    _audioPlayer.seek(Duration.zero);
  }

  void toggleLoop() {
    setState(() {
      isLooping = !isLooping;
      _audioPlayer.setLoopMode(isLooping ? LoopMode.one : LoopMode.off);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          child: Image.asset('assets/down_arrow.png'),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          Image.asset('assets/transcript_icon.png'),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // art work
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/child_with_dog.png',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Rain on Glass',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Text(
              'By: Painting with passion',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const Spacer(),
            StreamBuilder<Duration>(
              stream: _audioPlayer.positionStream,
              builder: (context, snapshot) {
                final position = snapshot.data ?? Duration.zero;
                final total = _audioPlayer.duration ?? Duration.zero;
                return ProgressBar(
                  progress: position,
                  total: total,
                  baseBarColor: DefaultColors.lightpink,
                  thumbColor: DefaultColors.pink,
                  progressBarColor: DefaultColors.pink,
                  onSeek: (duration) {
                    _audioPlayer.seek(duration);
                    // debugPrint('Seek time : $duration');
                  },
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shuffle,
                    color: DefaultColors.pink,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    seekBackward();
                  },
                  icon: const Icon(
                    Icons.skip_previous,
                    color: DefaultColors.pink,
                  ),
                ),
                StreamBuilder<PlayerState>(
                  stream: _audioPlayer.playerStateStream,
                  builder: (context, snapshot) {
                    final playerState = snapshot.data;
                    final processingState =
                        playerState?.processingState ?? ProcessingState.idle;
                    final playing = playerState?.playing ?? false;

                    if (processingState == ProcessingState.loading ||
                        processingState == ProcessingState.buffering) {
                      return Container(
                        margin: const EdgeInsets.all(10),
                        width: 70,
                        height: 70,
                        child: const CircularProgressIndicator(
                          color: DefaultColors.pink,
                        ),
                      );
                    } else if (processingState == ProcessingState.completed) {
                      // never triggered for some reason
                      return IconButton(
                        iconSize: 80,
                        onPressed: () {
                          seekRestart();
                        },
                        icon: const Icon(
                          Icons.replay_circle_filled,
                          color: DefaultColors.pink,
                        ),
                      );
                    } else if (!playing) {
                      return IconButton(
                        iconSize: 80,
                        onPressed: () {
                          togglePlayPause();
                        },
                        icon: const Icon(
                          Icons.play_circle_filled,
                          color: DefaultColors.pink,
                        ),
                      );
                    } else {
                      return IconButton(
                        iconSize: 80,
                        onPressed: () {
                          togglePlayPause();
                        },
                        icon: const Icon(
                          Icons.pause_circle_filled,
                          color: DefaultColors.pink,
                        ),
                      );
                    }
                  },
                ),
                IconButton(
                  onPressed: () {
                    seekForward();
                  },
                  icon: const Icon(
                    Icons.skip_next,
                    color: DefaultColors.pink,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    toggleLoop();
                  },
                  icon: Icon(
                    isLooping ? Icons.repeat_on_rounded : Icons.repeat_rounded,
                    color: DefaultColors.pink,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
