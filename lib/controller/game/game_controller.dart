import 'package:get/get.dart';
import 'package:hangman/controller/game/create_game_controller.dart';
import 'package:hangman/controller/game/game_play_controller.dart';
import 'package:hangman/models/game_settings.dart';

class GameController extends GetxController {
  @override
  void onInit() {
    Get.put(CreateGameController());
    Get.put(GamePlayController());

    super.onInit();
  }

  GameSettings gameSettings = GameSettings();

  GameSettings updateMaxHearts(int newMaxHearts) {
    gameSettings.maxHearts = newMaxHearts;
    return gameSettings;
  }

  GameSettings updateCanGuessWholeWord(bool newCanGuessWholeWord) {
    gameSettings.canGuessWholeWord = newCanGuessWholeWord;
    return gameSettings;
  }
}
