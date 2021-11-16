// Mocks generated by Mockito 5.0.16 from annotations
// in mc_character/test/viewmodel/character_viewmodel_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:mc_character/app/domain/entities/character_page.dart' as _i3;
import 'package:mc_character/app/domain/interfaces/character_interface.dart'
    as _i2;
import 'package:mc_character/app/domain/use_case/character_usecase.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeICharacterRepo_0 extends _i1.Fake implements _i2.ICharacterRepo {}

class _FakeCharacterPage_1 extends _i1.Fake implements _i3.CharacterPage {}

/// A class which mocks [CharacterUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockCharacterUseCase extends _i1.Mock implements _i4.CharacterUseCase {
  MockCharacterUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ICharacterRepo get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeICharacterRepo_0()) as _i2.ICharacterRepo);
  @override
  _i5.Future<_i3.CharacterPage> getCharacterPage(int? page) =>
      (super.noSuchMethod(Invocation.method(#getCharacterPage, [page]),
              returnValue:
                  Future<_i3.CharacterPage>.value(_FakeCharacterPage_1()))
          as _i5.Future<_i3.CharacterPage>);
  @override
  String toString() => super.toString();
}
