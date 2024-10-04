import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:mind_peace/core/theme.dart';

class MusicPlayerScreen extends StatelessWidget {
  const MusicPlayerScreen({super.key});

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
            ProgressBar(
              progress: const Duration(seconds: 30),
              total: const Duration(seconds: 100),
              baseBarColor: DefaultColors.lightpink,
              thumbColor: DefaultColors.pink,
              progressBarColor: DefaultColors.pink,
              onSeek: (duration) {
                // debugPrint('Seek time : $duration');
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
                  onPressed: () {},
                  icon: const Icon(
                    Icons.skip_previous,
                    color: DefaultColors.pink,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  iconSize: 80,
                  icon: const Icon(
                    Icons.pause_circle_filled,
                    color: DefaultColors.pink,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.skip_next,
                    color: DefaultColors.pink,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.repeat,
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
