import 'comics.dart';
import 'thumbnail.dart';

class Character {
  final int? id;
  final String? name;
  final String? description;
  final String? modified;
  final Thumbnail? thumbnail;
  final String? resourceURI;
  final Comics? comics;

  Character({
    this.id,
    this.name,
    this.description,
    this.modified,
    this.thumbnail,
    this.resourceURI,
    this.comics,
  });

  getAddress() => '${thumbnail!.path}.${thumbnail!.extension}';

  Character.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        description = json['description'] as String?,
        modified = json['modified'] as String?,
        thumbnail = (json['thumbnail'] as Map<String, dynamic>?) != null
            ? Thumbnail.fromJson(json['thumbnail'] as Map<String, dynamic>)
            : null,
        resourceURI = json['resourceURI'] as String?,
        comics = (json['comics'] as Map<String, dynamic>?) != null
            ? Comics.fromJson(json['comics'] as Map<String, dynamic>)
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
