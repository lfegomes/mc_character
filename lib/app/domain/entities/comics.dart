import 'items.dart';

class Comics {
  final int? available;
  final String? collectionURI;
  final List<Items>? items;
  final int? returned;

  Comics({
    this.available,
    this.collectionURI,
    this.items,
    this.returned,
  });

  Comics.fromJson(Map<String, dynamic> json)
      : available = json['available'] as int?,
        collectionURI = json['collectionURI'] as String?,
        items = (json['items'] as List?)
            ?.map((dynamic e) => Items.fromJson(e as Map<String, dynamic>))
            .toList(),
        returned = json['returned'] as int?;

  Map<String, dynamic> toJson() => {
        'available': available,
        'collectionURI': collectionURI,
        'items': items?.map((e) => e.toJson()).toList(),
        'returned': returned
      };
}
