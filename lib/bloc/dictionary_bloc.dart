import 'package:dictionary/models/word_response.dart';
import 'package:dictionary/repository/word_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DictionaryCubit extends Cubit<DictionaryState> {
  final WordRepository _repository;
  WordResonse? get dictionaryData => _repository.dictionaryData;

  DictionaryCubit(this._repository) : super(NoWordSearchedState());
  final queryController = TextEditingController();

  Future getWordSearched() async {
    emit(WordSearchingState());
    try {
      await _repository.getWordsFromDictionary(queryController.text);

      if (dictionaryData == null) {
        emit(ErrorState('There is some issue'));
      } else {
        emit(WordSearchedState());
        emit(NoWordSearchedState());
      }
    } on Exception catch (e) {
      print(e);
      emit(ErrorState(e.toString()));
    }
  }
}

//  base class for all states
abstract class DictionaryState {}

class NoWordSearchedState extends DictionaryState {}

class WordSearchingState extends DictionaryState {}

class WordSearchedState extends DictionaryState {}

class ErrorState extends DictionaryState {
  final String message;
  ErrorState(this.message);
}
