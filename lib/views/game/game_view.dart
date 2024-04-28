import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangman/controller/game/game_controller.dart';
import 'package:hangman/routes/routes.dart';
import 'package:hangman/views/game/create_game_view.dart';

class GameView extends GetView<GameController> {
  const GameView({super.key});

  static const String routeName = '/gameView';

  static const int gameViewNavigationKey = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: Get.nestedKey(GameView.gameViewNavigationKey),
        initialRoute: CreateGameView.routeName,
        onGenerateInitialRoutes: (navigator, initialRoute) {
          return [
            GetPageRoute(
              page: () =>
                  Routes.routes[initialRoute]?.call(context) ??
                  const Placeholder(),
            )
          ];
        },
        onGenerateRoute: (RouteSettings settings) {
          return GetPageRoute(
            settings: settings,
            page: () =>
                Routes.routes[settings.name]?.call(context) ??
                const Placeholder(),
          );
        },
      ),
    );
  }
}
