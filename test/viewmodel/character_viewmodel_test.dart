import 'package:flutter_test/flutter_test.dart';
import 'package:mc_character/app/domain/entities/character_page.dart';
import 'package:mc_character/app/domain/use_case/character_usecase.dart';
import 'package:mc_character/app/presentation/viewmodel/character_viewmodel.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../helper/mock.dart';
import 'character_viewmodel_test.mocks.dart';

@GenerateMocks([CharacterUseCase])
void main() {
  late MockCharacterUseCase useCase;
  late CharacterViewModel viewmodel;

  setUp(() {
    useCase = MockCharacterUseCase();
    viewmodel = CharacterViewModel(useCase);
  });

  final characterRawData = getMockCharacterRawData();
  final characterPage = characterRawData.data!;
  characterPage.nextPage = true;

  CharacterPage emptyCharacterPage = CharacterPage();

  group('ViewModel', () {
    test('Should append new items', () async {
      // arrange

      when(useCase.getCharacterPage(1)).thenAnswer((_) async => characterPage);
      // act
      await viewmodel.fetchCharacters(1);
      // assert
      expect(viewmodel.nextPage, 2);
      expect(viewmodel.newPageItems, characterPage.results);
      expect(viewmodel.appendCharacters, 1);
    });
    test('Should trigger error screen', () async {
      // arrange

      when(useCase.getCharacterPage(1))
          .thenAnswer((_) async => emptyCharacterPage);
      // act
      await viewmodel.fetchCharacters(1);
      // assert
      expect(viewmodel.somethingWentWrong, 1);
    });
  });
}
