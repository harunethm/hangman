import 'package:get/get.dart';
import 'package:hangman/config.dart';

class GamePlayController extends GetxController {
  RxInt remainingHearts = RxInt(Config.maxHearts);
  RxList<String> successFullyGuessedWords = RxList<String>([]);
  RxList<String> guessedLetters = RxList<String>([]);

  bool resetCurrentGame() {
    remainingHearts.value = Config.maxHearts;
    guessedLetters.clear();

    return true;
  }
}
