import 'package:hangman/config.dart';

class GameSettings {
  int maxHearts;
  bool canGuessWholeWord;

  GameSettings({
    this.maxHearts = Config.maxHearts,
    this.canGuessWholeWord = Config.canGuessWholeWord,
  });

  bool resetSettings() {
    maxHearts = Config.maxHearts;
    canGuessWholeWord = Config.canGuessWholeWord;
    return true;
  }
}
