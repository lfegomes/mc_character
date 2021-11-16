import '../../domain/entities/character_page.dart';
import 'character_dto.dart';

class CharacterPageDTO extends CharacterPage {
  final int? offset;
  final int? limit;
  final int? total;
  final int? count;
  final List<CharacterDTO>? results;

  CharacterPageDTO({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.results,
  });

  CharacterPageDTO.fromJson(Map<String, dynamic> json)
      : offset = json['offset'] as int?,
        limit = json['limit'] as int?,
        total = json['total'] as int?,
        count = json['count'] as int?,
        results = (json['results'] as List?)
            ?.map(
                (dynamic e) => CharacterDTO.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'offset': offset,
        'limit': limit,
        'total': total,
        'count': count,
        'results': results?.map((e) => e.toJson()).toList()
      };
}

extension CharacterPageMapper on CharacterPageDTO {
  CharacterPage toEntity() {
    return CharacterPage(
      offset: offset,
      limit: limit,
      total: total,
      count: count,
      results: results,
    );
  }
}
