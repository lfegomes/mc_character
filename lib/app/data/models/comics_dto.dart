import '../../domain/entities/comics.dart';
import 'items_dto.dart';

class ComicsDTO extends Comics {
  final int? available;
  final String? collectionURI;
  final List<ItemsDTO>? items;
  final int? returned;

  ComicsDTO({
    this.available,
    this.collectionURI,
    this.items,
    this.returned,
  });

  ComicsDTO.fromJson(Map<String, dynamic> json)
      : available = json['available'] as int?,
        collectionURI = json['collectionURI'] as String?,
        items = (json['items'] as List?)
            ?.map((dynamic e) => ItemsDTO.fromJson(e as Map<String, dynamic>))
            .toList(),
        returned = json['returned'] as int?;

  Map<String, dynamic> toJson() => {
        'available': available,
        'collectionURI': collectionURI,
        'items': items?.map((e) => e.toJson()).toList(),
        'returned': returned
      };
}

extension ComicsMapper on ComicsDTO {
  Comics toEntity() {
    return Comics(
      available: available,
      collectionURI: collectionURI,
      items: items,
    );
  }
}
