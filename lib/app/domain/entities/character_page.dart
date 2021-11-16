import 'character.dart';

class CharacterPage {
  bool nextPage = false;
  final int? offset;
  final int? limit;
  final int? total;
  final int? count;
  final List<Character>? results;

  CharacterPage({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.results,
  });

  CharacterPage.fromJson(Map<String, dynamic> json)
      : offset = json['offset'] as int?,
        limit = json['limit'] as int?,
        total = json['total'] as int?,
        count = json['count'] as int?,
        results = (json['results'] as List?)
            ?.map((dynamic e) => Character.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'offset': offset,
        'limit': limit,
        'total': total,
        'count': count,
        'results': results?.map((e) => e.toJson()).toList()
      };
}
