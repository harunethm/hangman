import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hangman/config.dart';
import 'package:flutter/services.dart' show rootBundle;

class WordsAPI {
  WordsAPI._internal();
  static final WordsAPI _instance = WordsAPI._internal();

  static WordsAPI get instance => _instance;

  Future<Map<String, dynamic>> getWords() async {
    if (Config.useWordsFromLocal) {
      return _getWordsFromLocal();
    } else {
      return _getWordsFromApi();
    }
  }

  Future<Map<String, dynamic>> _getWordsFromLocal() async {
    final jsonStr = await rootBundle.loadString(
      Config.wordsLocalPath,
      cache: !kDebugMode,
    );
    final json = jsonDecode(jsonStr) as Map<String, dynamic>;

    return json;
  }

  Future<Map<String, dynamic>> _getWordsFromApi() async {
    final response = await Dio().get(
      Uri.parse(Config.wordsApiPath).path,
    );
    return response.data;
  }
}
