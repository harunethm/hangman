import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hangman/api/words_api.dart';

class AdminView extends StatelessWidget {
  AdminView({super.key});

  static const String routeName = '/adminView';

  final RxnString errorStr = RxnString(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: _checkWords,
              child: const Text('Check Words'),
            ),
            Obx(() => Text(errorStr.value ?? '')),
          ],
        ),
      ),
    );
  }

  _checkWords() async {
    errorStr.value = null;
    final wordsAll = await WordsAPI.instance.getWords();
    if (wordsAll.isEmpty) {
      errorStr.value = 'No words found';
      return;
    }

    if (wordsAll.keys.length != 5) {
      errorStr.value = '${wordsAll.keys.length}categories found';
      return;
    }

    var listOfAllWords = [];

    for (var cat in wordsAll.keys) {
      final category = wordsAll[cat] as Map;
      if (category.keys.length != 5) {
        errorStr.value = '${category.keys.length} category in $cat found';
        return;
      }

      for (var catLength in category.keys) {
        final words = category[catLength] as List;
        if (words.length != 8) {
          errorStr.value = 'Not all word lengths found in $cat => $catLength';
          return;
        }

        listOfAllWords.addAll(words);
      }
    }

    if (listOfAllWords.length != 200) {
      errorStr.value = '${listOfAllWords.length} word found';
      return;
    }

    errorStr.value = 'No Problem 🥳';
  }
}
