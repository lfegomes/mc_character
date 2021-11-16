// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CharacterViewModel on _CharacterViewModelBase, Store {
  final _$somethingWentWrongAtom =
      Atom(name: '_CharacterViewModelBase.somethingWentWrong');

  @override
  int get somethingWentWrong {
    _$somethingWentWrongAtom.reportRead();
    return super.somethingWentWrong;
  }

  @override
  set somethingWentWrong(int value) {
    _$somethingWentWrongAtom.reportWrite(value, super.somethingWentWrong, () {
      super.somethingWentWrong = value;
    });
  }

  final _$appendCharactersAtom =
      Atom(name: '_CharacterViewModelBase.appendCharacters');

  @override
  int get appendCharacters {
    _$appendCharactersAtom.reportRead();
    return super.appendCharacters;
  }

  @override
  set appendCharacters(int value) {
    _$appendCharactersAtom.reportWrite(value, super.appendCharacters, () {
      super.appendCharacters = value;
    });
  }

  final _$fetchCharactersAsyncAction =
      AsyncAction('_CharacterViewModelBase.fetchCharacters');

  @override
  Future<void> fetchCharacters(int page) {
    return _$fetchCharactersAsyncAction.run(() => super.fetchCharacters(page));
  }

  @override
  String toString() {
    return '''
somethingWentWrong: ${somethingWentWrong},
appendCharacters: ${appendCharacters}
    ''';
  }
}
