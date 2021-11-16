import 'package:flutter_test/flutter_test.dart';
import 'package:mc_character/app/domain/interfaces/character_interface.dart';
import 'package:mc_character/app/domain/use_case/character_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../helper/mock.dart';
import 'character_usecase_test.mocks.dart';

///
/// Test was run with constant value ITEMS_PER_PAGE = 10
///

@GenerateMocks([ICharacterRepo])
void main() {
  late ICharacterRepo mockRepository;
  late CharacterUseCase useCase;

  setUp(() {
    mockRepository = MockICharacterRepo();
    useCase = CharacterUseCase(mockRepository);
  });

  final characterListingPage1 = getMockCharacterRawData();
  final characterListingPage2 = getMockCharacterRawData();

  group('Get character page', () {
    test('Should return page first of characters', () async {
      // arrange
      when(mockRepository.getCharacterData(offset: 0))
          .thenAnswer((_) async => characterListingPage1);
      // act
      final result = await useCase.getCharacterPage(1);
      // assert
      expect(result, characterListingPage1.data);
      expect(characterListingPage1.data!.nextPage, true);
      verify(mockRepository.getCharacterData(offset: 0));
    });

    test('Should return final page of characters', () async {
      // arrange
      when(mockRepository.getCharacterData(offset: 20))
          .thenAnswer((_) async => characterListingPage2);
      // act
      final result = await useCase.getCharacterPage(3);
      // assert
      expect(result, characterListingPage2.data);
      expect(characterListingPage2.data!.nextPage, false);
      verify(mockRepository.getCharacterData(offset: 20));
    });
  });
}
