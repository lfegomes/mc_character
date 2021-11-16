import '../entities/character_raw.dart';

abstract class ICharacterRepo {
  Future<CharacterRawData> getCharacterData({required int offset});
}
