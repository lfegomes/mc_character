import '../../domain/entities/character.dart';
import 'comics_dto.dart';
import 'thumbnail_dto.dart';

class CharacterDTO extends Character {
  final int? id;
  final String? name;
  final String? description;
  final String? modified;
  final ThumbnailDTO? thumbnail;
  final String? resourceURI;
  final ComicsDTO? comics;

  CharacterDTO({
    this.id,
    this.name,
    this.description,
    this.modified,
    this.thumbnail,
    this.resourceURI,
    this.comics,
  });

  CharacterDTO.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        description = json['description'] as String?,
        modified = json['modified'] as String?,
        thumbnail = (json['thumbnail'] as Map<String, dynamic>?) != null
            ? ThumbnailDTO.fromJson(json['thumbnail'] as Map<String, dynamic>)
            : null,
        resourceURI = json['resourceURI'] as String?,
        comics = (json['comics'] as Map<String, dynamic>?) != null
            ? ComicsDTO.fromJson(json['comics'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'modified': modified,
        'thumbnail': thumbnail?.toJson(),
        'resourceURI': resourceURI,
        'comics': comics?.toJson()
      };
}

extension CharacterMapper on CharacterDTO {
  Character toEntity() {
    return Character(
      id: id,
      name: name,
      description: description,
      modified: modified,
      thumbnail: thumbnail,
      resourceURI: resourceURI,
      comics: comics,
    );
  }
}
