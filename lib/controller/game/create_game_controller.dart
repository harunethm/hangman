import 'package:get/get.dart';

import 'package:hangman/config.dart';
import 'package:hangman/controller/game/game_controller.dart';

class CreateGameController extends GetxController {
  RxInt maxHearts = RxInt(Config.maxHearts);
  RxBool canGuessWholeWord = RxBool(Config.canGuessWholeWord);

  bool _updateMaxHearts(int newMaxHearts) {
    if (Get.isRegistered<GameController>()) {
      final newSettings =
          Get.find<GameController>().updateMaxHearts(newMaxHearts);
      return newSettings.maxHearts == newMaxHearts;
    }

    return false;
  }

  bool _updateCanGuessWholeWord(bool newCanGuessWholeWord) {
    if (Get.isRegistered<GameController>()) {
      final newSettings = Get.find<GameController>()
          .updateCanGuessWholeWord(newCanGuessWholeWord);
      return newSettings.canGuessWholeWord == newCanGuessWholeWord;
    }

    return false;
  }

  bool createGame() {
    final resMaxHearts = _updateMaxHearts(maxHearts.value);
    final resGuessWholeWord = _updateCanGuessWholeWord(canGuessWholeWord.value);

    return resMaxHearts && resGuessWholeWord;
  }
}
