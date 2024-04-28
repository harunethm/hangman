import 'package:flutter/material.dart';

import 'package:hangman/views/admin_view.dart';
import 'package:hangman/views/game/create_game_view.dart';
import 'package:hangman/views/game/game_play_view.dart';
import 'package:hangman/views/game/game_view.dart';
import 'package:hangman/views/home_page.dart';
import 'package:hangman/views/profile_view.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    HomeView.routeName: (context) => const HomeView(),
    GameView.routeName: (context) => const GameView(),
    CreateGameView.routeName: (context) => CreateGameView(),
    GamePlayView.routeName: (context) => GamePlayView(),
    ProfileView.routeName: (context) => const ProfileView(),
    AdminView.routeName: (context) => AdminView(),
  };
}
