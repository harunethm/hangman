import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangman/constants/size_constants.dart';
import 'package:hangman/controller/game/game_play_controller.dart';
import 'package:hangman/views/game/game_view.dart';

class GamePlayView extends GetView<GamePlayController> {
  GamePlayView({super.key});

  static const routeName = '/gamePlayView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('HANGMAN'),
        actions: [
          IconButton(
            onPressed: () {
              Get.back(id: GameView.gameViewNavigationKey);
            },
            icon: const Icon(Icons.exit_to_app_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: pagePaddingHorizontal),
        child: Column(
          children: [
            Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: Container(
                color: Colors.red,
                alignment: Alignment.center,
                child: Text('Hanged Man'),
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Container(
                color: Colors.blue,
                child: Text('Word'),
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Container(
                color: Colors.blue,
                child: Text('Word'),
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Container(
                color: Colors.blue,
                child: Text('Word'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
