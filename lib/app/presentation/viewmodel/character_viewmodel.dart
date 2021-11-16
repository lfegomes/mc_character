import 'package:mobx/mobx.dart';

import '../../domain/entities/character.dart';
import '../../domain/use_case/character_usecase.dart';

part 'character_viewmodel.g.dart';

class CharacterViewModel = _CharacterViewModelBase with _$CharacterViewModel;

abstract class _CharacterViewModelBase with Store {
  CharacterUseCase uc;
  _CharacterViewModelBase(this.uc);

  var newPageItems = <Character>[];
  var nextPage = 1;

  @observable
  int somethingWentWrong = 0;

  @observable
  int appendCharacters = 0;

  @action
  Future<void> fetchCharacters(int page) async {
    try {
      var characterPage = await uc.getCharacterPage(page);
      if (characterPage.nextPage == true) {
        nextPage++;
      } else {
        nextPage = 0;
      }
      newPageItems = characterPage.results!;
      appendCharacters++;
    } catch (e) {
      somethingWentWrong++;
    }
  }
}
