import '../../../core/utils/constants.dart';
import '../entities/character_page.dart';
import '../interfaces/character_interface.dart';

class CharacterUseCase {
  final ICharacterRepo repository;

  CharacterUseCase(this.repository);

  Future<CharacterPage> getCharacterPage(int page) async {
    var limit = Constant.ITEMS_PER_PAGE;
    int offset = (page - 1) * 10;
    var response = await repository.getCharacterData(offset: offset);
    var total = response.data!.total!;
    var last = offset + limit;
    if (total > last) {
      response.data!.nextPage = true;
    }
    // var limit = Constant.ITEMS_PER_PAGE;
    // var count = response.data!.count!;
    // if (limit >= count) {
    //   response.data!.nextPage = true;
    // }
    return response.data!;
  }
}
