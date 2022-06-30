import 'dart:convert';
import 'dart:io';
import 'package:dictionary/models/word_response.dart';
import 'package:dictionary/service/http_service.dart';

class WordRepository {

    WordResonse? _dictionaryData;
  WordResonse? get dictionaryData => _dictionaryData;


  Future<void> getWordsFromDictionary(String query) async {
    try {
      final reponse = await HttpService.getRequest("en/$query");

      if (reponse.statusCode == 200) {
          _dictionaryData = WordResonse.fromJson(jsonDecode(reponse.body)[0]);
    
      } else {
       
      }
    } on SocketException {
      rethrow;
    } on HttpException {
      rethrow;
    } on FormatException {
      rethrow;
    }
  }
}
