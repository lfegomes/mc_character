import 'dart:convert';

import 'package:mc_character/app/domain/entities/character_raw.dart';

import 'reader.dart';

CharacterRawData getMockCharacterRawData() {
  return CharacterRawData.fromJson(jsonDecode(mockFile("character.json")));
}
