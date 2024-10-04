import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_peace/features/music/presentation/music_player_screen.dart';
import 'package:mind_peace/features/music/presentation/playlist_screen.dart';
import 'package:mind_peace/presentation/bottomNavBar/bloc/navigate_bloc.dart';
import 'package:mind_peace/presentation/bottomNavBar/bloc/navigation_state.dart';

import 'package:mind_peace/presentation/bottomNavBar/widgets/bottom_nav_bar.dart';
import 'package:mind_peace/presentation/pages/meditation_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Widget> pages = [
    const MeditationScreen(),
    PlaylistScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          if (state is NavigationChanged) {
            return pages[state.index];
          }
          return pages[0];
        },
      ),
      bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          int currentIndex = 0;
          if (state is NavigationChanged) {
            currentIndex = state.index;
          }

          return BottomNavBar(currentIndex: currentIndex, items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/menu_home.png',
                color: currentIndex == 0
                    ? Theme.of(context).focusColor
                    : Theme.of(context).primaryColor,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/menu_songs.png',
                  color: currentIndex == 1
                      ? Theme.of(context).focusColor
                      : Theme.of(context).primaryColor),
              label: 'Songs',
            ),
          ]);
        },
      ),
    );
  }
}
