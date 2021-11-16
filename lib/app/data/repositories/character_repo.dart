import '../../domain/entities/character_raw.dart';
import '../../domain/interfaces/character_interface.dart';
import '../models/character_raw_dto.dart';
import '../services/character_service.dart';

class CharacterRepo implements ICharacterRepo {
  final CharacterService _characterService;

  CharacterRepo(this._characterService);

  @override
  Future<CharacterRawData> getCharacterData({required int offset}) async {
    var response = await _characterService.characterListing(offset);
    return response.toEntity();
  }
}
