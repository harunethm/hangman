import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangman/config.dart';
import 'package:hangman/constants/size_constants.dart';
import 'package:hangman/controller/game/create_game_controller.dart';
import 'package:hangman/views/game/game_play_view.dart';
import 'package:hangman/views/game/game_view.dart';
import 'package:hangman/widgets/custom_space.dart';

const _maxAllowedHeart = 50;

class CreateGameView extends GetView<CreateGameController> {
  CreateGameView({super.key});

  static const routeName = '/createGameView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Game'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: pagePaddingHorizontal),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child:
                        Obx(() => Text(controller.maxHearts.value.toString())),
                  ),
                  Expanded(
                    child: Obx(() => Slider.adaptive(
                          min: 1,
                          max: _maxAllowedHeart.toDouble(),
                          divisions: _maxAllowedHeart,
                          value: controller.maxHearts.value.toDouble(),
                          onChanged: (value) {
                            controller.maxHearts.value = value.toInt();
                          },
                        )),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.maxHearts.value = Config.maxHearts;
                    },
                    icon: const Icon(Icons.restart_alt_rounded),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                ],
              ),
              Obx(() => SwitchListTile.adaptive(
                    value: controller.canGuessWholeWord.value,
                    title: const Text('Can Player Guess Whole Word'),
                    onChanged: (value) {
                      controller.canGuessWholeWord.value = value;
                    },
                  )),
              const CustomSpace(),
              ElevatedButton(
                onPressed: () {
                  final success = controller.createGame();
                  if (success) {
                    Get.toNamed(
                      GamePlayView.routeName,
                      id: GameView.gameViewNavigationKey,
                    );
                  }
                },
                child: const Text('Create Game'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
